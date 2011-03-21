PORTS = security/py-krbV \
        net/py-urlgrabber \
        misc/rpm \
        misc/py-yum-metadata-parser

PORTSROOT = /usr/ports/mystuff
PKGSROOT  = /usr/ports/packages

SITEHOST  = site5
SITEROOT  = public_html/openbsd/mystuff

all:
	@echo "Specify a target:"
	@echo "    publish           Publish source and packages."
	@echo "    publish-source    Publish port sources as .tar.gz files per port."
	@echo "    publish-packages  Publish built packages per port."
	@echo "    SHA1              Generate new SHA1 files on ${SITEHOST}."

publish: publish-source publish-packages

publish-source:
	@tmpdir="$$(mktemp -d -p $$(pwd))" ; \
	sitedir="${SITEROOT}/$$(uname -r)/src" ; \
	ssh ${SITEHOST} mkdir -p $$sitedir ; \
	for port in ${PORTS} ; do \
		if [ ! -d "$$port" ]; then \
			echo "*** Missing $$port" ; \
			exit 1 ; \
		fi ; \
		src_archive="$$tmpdir/$$(basename $$port).tar.gz" ; \
		tar -cvpf - $$port | gzip -9c > $$src_archive ; \
		scp $$src_archive ${SITEHOST}:$$sitedir ; \
	done ; \
	rm -rf $$tmpdir

publish-packages:
	@cwd="$$(pwd)" ; \
	sitedir="${SITEROOT}/$$(uname -r)/packages/$$(machine -a)" ; \
	ssh ${SITEHOST} mkdir -p $$sitedir ; \
	for port in ${PORTS} ; do \
		if [ ! -d "${PORTSROOT}/$$port" ]; then \
			echo "*** Missing ${PORTSROOT}/$$port" ; \
			exit 1 ; \
		fi ; \
		cd ${PORTSROOT}/$$port ; \
		fullpkgname="$$(make show=FULLPKGNAME)" ; \
		pkgfile="${PKGSROOT}/$$(machine -a)/ftp/$$fullpkgname.tgz" ; \
		if [ -f "$$pkgfile" ]; then \
			scp $$pkgfile ${SITEHOST}:$$sitedir ; \
		else \
			echo "*** Missing $$pkgfile" ; \
			exit 1 ; \
		fi ; \
		cd $$cwd ; \
	done

_digest_file:
	@tmpdir="$$(mktemp -d -p $$(pwd))" ; \
	ssh ${SITEHOST} mkdir -p ${SITEDIR} ; \
	echo "Generating SHA-1 digests for ${DESC}..." ; \
	fns="$$(ssh ${SITEHOST} ls -1 ${SITEDIR}/${MASK})" ; \
	for fn in $$fns ; do \
		base="$$(basename $$fn)" ; \
		echo "    $$base" ; \
		ssh ${SITEHOST} "( cd ${SITEDIR} ; openssl dgst -sha1 $$base )" >> $$tmpdir/SHA1 ; \
	done ; \
	sort $$tmpdir/SHA1 > $$tmpdir/SHA1.new ; \
	mv $$tmpdir/SHA1.new $$tmpdir/SHA1 ; \
	scp $$tmpdir/SHA1 ${SITEHOST}:${SITEDIR} ; \
	rm -rf $$tmpdir

SHA1:
	@env TYPE=SHA1 \
	     SITEDIR="${SITEROOT}/$$(uname -r)/src" \
	     DESC="source archives" \
	     MASK="*.tar.gz" \
	${MAKE} _digest_file ; \
	env TYPE=SHA1 \
	    SITEDIR="${SITEROOT}/$$(uname -r)/packages/$$(machine -a)" \
	    DESC="packages" \
	    MASK="*.tgz" \
	${MAKE} _digest_file

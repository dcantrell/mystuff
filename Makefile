# List of all ports in this project
PORTS !=       find . -type d -maxdepth 2 | grep -E "\/.+\/" | grep -v "\.git" | while read f ; do echo $${f} | cut -c3- ; done

# Any target can use PORTSTMP, but it's removed after each target is run
PORTSTMP !=    mktemp -d -p ${PWD}

# System and release specific information
RELEASE !=     uname -r
MACHINE !=     machine -a

# Use the first port to collect ports system settings
_FIRSTPORT !=  echo ${PORTS} | cut -d ' ' -f 1
FULLDISTDIR != ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=FULLDISTDIR )
PORTSDIR !=    ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=PORTSDIR )
PKGREPO !=     ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=PACKAGE_REPOSITORY )
MYSTUFFROOT =  ${PORTSDIR}/mystuff

# Publishing location
SITEHOST =     site5
SITEROOT =     public_html/openbsd/mystuff

# Commands
RSYNC =        rsync -avz --progress

all:
	@echo "Specify a target:"
	@echo "    publish           Publish source and packages."
	@echo "    publish-source    Publish port sources as .tar.gz files per port."
	@echo "    publish-packages  Publish built packages per port."
	@echo "    list              Show list of all ports in this tree."
	@echo "    SHA1              Generate new SHA1 files on ${SITEHOST}."

publish: publish-source publish-distfiles publish-packages
	@${RSYNC} README ${SITEHOST}:${SITEROOT}

publish-source:
	@ssh ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/src
.for port in ${PORTS}
	@env PORT="SOURCE: ${port}" ${MAKE} _show-header
	@env PORT=${port} ${MAKE} _src-archive
	@env PORT=${port} ${MAKE} _upload-src-archive
.endfor

publish-distfiles:
	@ssh ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/distfiles
.for port in ${PORTS}
	@env PORT="DISTFILES: ${port}" ${MAKE} _show-header
	@env DISTFILES="$$(cd ${MYSTUFFROOT}/${port} && ${MAKE} show=DISTFILES)" ${MAKE} _publish-port-distfiles
.endfor

publish-packages:
	@cwd="$$(pwd)" ; \
	ssh ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/packages/${MACHINE} ; \
	for port in ${PORTS} ; do \
		if [ ! -d "${MYSTUFFROOT}/$$port" ]; then \
			echo "*** Missing ${MYSTUFFROOT}/$$port" ; \
		fi ; \
		cd ${MYSTUFFROOT}/$$port ; \
		pkglist="$$(make show=FULLPKGNAME)" ; \
		for flavor in $$(make show=FLAVORS) ; do \
			pkglist="$${pkglist} $$(env FLAVOR=$${flavor} make show=FULLPKGNAME)" ; \
		done ; \
		for pkg in $${pkglist} ; do \
			pkgfile="${PKGREPO}/${MACHINE}/ftp/$$pkg.tgz" ; \
			if [ -f "$$pkgfile" ]; then \
				${RSYNC} $$pkgfile ${SITEHOST}:${SITEROOT}/${RELEASE}/packages/${MACHINE} ; \
			else \
				echo "*** Missing $$pkgfile" ; \
			fi ; \
		done ; \
		cd $$cwd ; \
	done

SHA1:
	@env SUBDIR="src" DESC="source archives" MASK="*.tar.gz" ${MAKE} _digest_file
	@env SUBDIR="distfiles" DESC="distfiles" MASK="*" ${MAKE} _digest_file
	@env SUBDIR="packages/${MACHINE}" DESC="packages" MASK="*.tgz" ${MAKE} _digest_file

list:
.for port in ${PORTS}
	@echo ${port}
.endfor

_show-header:
	@echo -n "+-"
	@echo -n "${PORT}" | sed -e 's/./-/g'
	@echo "-+"
	@echo "| ${PORT} |"
	@echo -n "+-"
	@echo -n "${PORT}" | sed -e 's/./-/g'
	@echo "-+"

_digest_file:
	@ssh ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/${SUBDIR} ; \
	echo "Generating SHA-1 digests for ${DESC}..." ; \
	fns="$$(ssh ${SITEHOST} ls -1 ${SITEROOT}/${RELEASE}/${SUBDIR}/${MASK} | grep -v SHA1)" ; \
	for fn in $$fns ; do \
		base="$$(basename $$fn)" ; \
		echo "    $$base" ; \
		ssh ${SITEHOST} "( cd ${SITEROOT}/${RELEASE}/${SUBDIR} ; openssl dgst -sha1 $$base )" >> ${PORTSTMP}/SHA1 ; \
	done ; \
	sort ${PORTSTMP}/SHA1 > ${PORTSTMP}/SHA1.new ; \
	mv ${PORTSTMP}/SHA1.new ${PORTSTMP}/SHA1 ; \
	${RSYNC} ${PORTSTMP}/SHA1 ${SITEHOST}:${SITEROOT}/${RELEASE}/${SUBDIR}

_src-archive:
	@cd ${PWD} ; \
	tar -cvpf - ${PORT} | gzip -9c > ${PORTSTMP}/${PORT:T}.tar.gz
	@mv ${PORTSTMP}/${PORT:T}.tar.gz ${PWD}

_upload-src-archive:
	@${RSYNC} ${PWD}/${PORT:T}.tar.gz ${SITEHOST}:${SITEROOT}/${RELEASE}/src/${PORT:T}.tar.gz
	@rm -f ${PWD}/${PORT:T}.tar.gz

_publish-port-distfiles:
.for distfile in ${DISTFILES}
.if exists(${FULLDISTDIR}/${distfile})
	@${RSYNC} ${FULLDISTDIR}/${distfile} ${SITEHOST}:${SITEROOT}/${RELEASE}/distfiles/${distfile}
.else
	@echo "*** Missing ${FULLDISTDIR}/${distfile}"
.endif
.endfor

.END:
	@rm -rf ${PORTSTMP}

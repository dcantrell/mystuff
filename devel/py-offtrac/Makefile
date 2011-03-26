COMMENT =           Python xmlrpc client library for trac instances

MODPY_EGG_VERSION = 0.0.3
DISTNAME =          offtrac-${MODPY_EGG_VERSION}
PKGNAME =           py-offtrac-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          https://fedorahosted.org/offtrac/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MODULES =           lang/python
BUILD_DEPENDS =     ::devel/git

# We have to clone the git repo and generate a tar.gz file from there.
NO_CHECKSUM =       Yes

# GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-fetch:
	@if [ ! -f ${DISTDIR}/${DISTNAME}.tar.gz ]; then \
		tmpdir=$$(mktemp -d -p ${WRKDIR}) ; \
		cd $$tmpdir ; \
		git clone git://git.fedorahosted.org/git/offtrac ; \
		cd offtrac ; \
		git checkout -b tarball ${MODPY_EGG_VERSION} ; \
		${MODPY_BIN} setup.py sdist ; \
		${INSTALL_DATA} dist/${DISTNAME}.tar.gz ${DISTDIR}/${DISTNAME}.tar.gz ; \
	fi

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-offtrac
	for f in COPYING LICENSE README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-offtrac/$$f ; \
	done

.include <bsd.port.mk>

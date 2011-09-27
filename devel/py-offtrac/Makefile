# $OpenBSD$

COMMENT =                Python xmlrpc client library for trac instances

MODPY_EGG_VERSION =      0.0.3
REVISION =               3
DISTNAME =               offtrac-${MODPY_EGG_VERSION}
PKGNAME =                py-offtrac-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               https://fedorahosted.org/offtrac/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MODULES =                lang/python

BUILD_DEPENDS =          devel/git

PKG_ARCH =               *

# We have to clone the git repo and generate a tar.gz file from there.
NO_CHECKSUM =            Yes
GIT_SRC =                ${WRKDIR}/offtrac

pre-fetch:
	git clone git://git.fedorahosted.org/git/offtrac ${GIT_SRC}
	cd ${GIT_SRC} ; git checkout -b tarball ${MODPY_EGG_VERSION}
	cd ${GIT_SRC} ; ${MODPY_BIN} setup.py sdist
	cp ${GIT_SRC}/dist/${DISTNAME}${EXTRACT_SUFX} ${DISTDIR}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-offtrac
.for d in COPYING LICENSE README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-offtrac/${d}
.endfor

.include <bsd.port.mk>

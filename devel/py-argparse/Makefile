# $OpenBSD$

COMMENT =                Python module for parsing command line arguments

MODPY_EGG_VERSION =      1.2.1
REVISION =               1
DISTNAME =               argparse-${MODPY_EGG_VERSION}
PKGNAME =                py-argparse-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               https://code.google.com/p/argparse/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# ASL 2.0
# http://www.apache.org/licenses/LICENSE-2.0
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://argparse.googlecode.com/files/

MODULES =                lang/python

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-argparse
.for d in NEWS.txt README.txt
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-argparse/${d}
.endfor

.include <bsd.port.mk>

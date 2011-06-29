COMMENT =           Python module for parsing command line arguments

MODPY_EGG_VERSION = 1.2.1
REVISION =          0
DISTNAME =          argparse-${MODPY_EGG_VERSION}
PKGNAME =           py-argparse-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          https://code.google.com/p/argparse/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://argparse.googlecode.com/files/

MODULES =           lang/python

MODPY_SETUPTOOLS =  Yes

CHECK_LIB_DEPENDS = Yes

PKG_ARCH =          *

# ASL 2.0
# http://www.apache.org/licenses/LICENSE-2.0
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-argparse
	for f in NEWS.txt README.txt ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-argparse/$$f ; \
	done

.include <bsd.port.mk>

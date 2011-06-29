COMMENT =           Multi-threaded mail queue manager for TurboGears

MODPY_EGG_VERSION = 3.0.3
REVISION =          0
DISTNAME =          TurboMail-${MODPY_EGG_VERSION}
PKGNAME =           py-turbomail-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          http://www.python-turbomail.org/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/T/TurboMail/

MODULES =           lang/python

MODPY_SETUPTOOLS =  Yes

PKG_ARCH =          *

CHECK_LIB_DEPENDS = Yes

# MIT
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-turbomail
	for f in README.txt ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-turbomail/$$f ; \
	done

.include <bsd.port.mk>

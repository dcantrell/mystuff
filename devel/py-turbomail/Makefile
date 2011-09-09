# $OpenBSD$

COMMENT =                Multi-threaded mail queue manager for TurboGears

MODPY_EGG_VERSION =      3.0.3
REVISION =               1
DISTNAME =               TurboMail-${MODPY_EGG_VERSION}
PKGNAME =                py-turbomail-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               http://www.python-turbomail.org/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# MIT
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://pypi.python.org/packages/source/T/TurboMail/

MODULES =                lang/python

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-turbomail
	${INSTALL_DATA} ${WRKSRC}/README.txt ${PREFIX}/share/doc/py-turbomail/README.txt

.include <bsd.port.mk>

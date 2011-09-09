# $OpenBSD$

COMMENT =                Small utility module for Python

MODPY_EGG_VERSION =      1.0.0
REVISION =               1
DISTNAME =               kitchen-${MODPY_EGG_VERSION}
PKGNAME =                py-kitchen-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               https://pypi.python.org/pypi/kitchen/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           https://fedorahosted.org/releases/k/i/kitchen/

MODULES =                lang/python
BUILD_REQUIRES +=        devel/py-nose \
                         textproc/py-chardet \
                         textproc/py-sphinx
RUN_DEPENDS +=           textproc/py-chardet

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-kitchen
.for d in COPYING COPYING.LESSER NEWS README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-kitchen/${d}
.endfor

.include <bsd.port.mk>

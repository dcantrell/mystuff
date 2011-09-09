# $OpenBSD$

COMMENT =                Python-based project scripting like make

MODPY_EGG_VERSION =      1.0.4
REVISION =               2
DISTNAME =               Paver-${MODPY_EGG_VERSION}
PKGNAME =                py-paver-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               http://paver.github.com/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# BSD
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://pypi.python.org/packages/source/P/Paver/

MODULES =                lang/python
BUILD_DEPENDS +=         devel/py-nose \
                         devel/py-setuptools \
                         textproc/py-sphinx
RUN_DEPENDS +=           devel/py-setuptools

PKG_ARCH =               *

post-install:
	${INSTALL_SCRIPT_DIR} ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/distutils_scripts/paver ${PREFIX}/bin/paver
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-paver
.for d in LICENSE.txt README.txt
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-paver/${d}
.endfor

.include <bsd.port.mk>

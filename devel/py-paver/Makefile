COMMENT =           Python-based project scripting like make

MODPY_EGG_VERSION = 1.0.4
REVISION =          0
DISTNAME =          Paver-${MODPY_EGG_VERSION}
PKGNAME =           py-paver-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          http://paver.github.com/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/P/Paver/

MODULES =           lang/python
BUILD_DEPENDS +=    devel/py-nose \
                    devel/py-setuptools \
                    textproc/py-sphinx
RUN_DEPENDS +=      devel/py-setuptools

CHECK_LIB_DEPENDS = Yes

PKG_ARCH =          *

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-paver
	for f in LICENSE.txt README.txt ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-paver/$$f ; \
	done

.include <bsd.port.mk>

COMMENT =           Small, useful pieces of code to make Python coding easier

MODPY_EGG_VERSION = 1.0.0
DISTNAME =          kitchen-${MODPY_EGG_VERSION}
PKGNAME =           py-kitchen-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          https://pypi.python.org/pypi/kitchen/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      https://fedorahosted.org/releases/k/i/kitchen/

MODULES =           lang/python
BUILD_REQUIRES +=   devel/py-nose \
                    textproc/py-chardet \
                    textproc/py-sphinx
RUN_DEPENDS +=      textproc/py-chardet

MODPY_SETUPTOOLS =  Yes

PKG_ARCH =          *

# LGPLv2.1+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-kitchen
	for f in COPYING COPYING.LESSER NEWS README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-kitchen/$$f ; \
	done

.include <bsd.port.mk>

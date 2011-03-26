COMMENT =           Transifex translation management client tool

MODPY_EGG_VERSION = 0.4.1
DISTNAME =          transifex-client-${MODPY_EGG_VERSION}
CATEGORIES =        textproc
HOMEPAGE =          http://www.indifex.com/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/t/transifex-client/

MODULES =           lang/python
BUILD_DEPENDS +=    ::devel/py-setuptools

PKG_ARCH =          *

# GPLv2
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/transifex-client
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/transifex-client/README

.include <bsd.port.mk>

COMMENT =           Python module for working with OpenPGP messages

MODPY_EGG_VERSION = 0.1
DISTNAME =          pygpgme-${MODPY_EGG_VERSION}
PKGNAME =           py-gpgme-${MODPY_EGG_VERSION}
CATEGORIES =        security
HOMEPAGE =          http://pypi.python.org/pypi/pygpgme/0.1/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/p/pygpgme/

MODULES =           lang/python
BUILD_DEPENDS +=    ::security/gpgme

CONFIGURE_ENV +=    CFLAGS=-I/usr/local/include

# LGPLv2.1+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-gpgme
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/py-gpgme/README

.include <bsd.port.mk>

# $OpenBSD$

COMMENT =                high-level cross-protocol url retriever

MODPY_EGG_VERSION =      3.9.1
REVISION =               3
DISTNAME =               urlgrabber-3.9.1
PKGNAME =                py-urlgrabber-${MODPY_EGG_VERSION}
CATEGORIES =             net
HOMEPAGE =               http://urlgrabber.baseurl.org/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://urlgrabber.baseurl.org/download/

MODULES =                lang/python
BUILD_DEPENDS =          net/py-curl
RUN_DEPENDS =            net/py-curl

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-urlgrabber
.for d in ChangeLog LICENSE README TODO PKG-INFO
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-urlgrabber/${d}
.endfor

.include <bsd.port.mk>

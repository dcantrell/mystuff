# $OpenBSD$

COMMENT =                Python module to talk to Bugzilla via XMLRPC

MODPY_EGG_VERSION =      0.6.2
REVISION =               0
DISTNAME =               python-bugzilla-${MODPY_EGG_VERSION}
PKGNAME =                py-bugzilla-${MODPY_EGG_VERSION}
EXTRACT_SUFX =           .tar.bz2
CATEGORIES =             devel
HOMEPAGE =               https://fedorahosted.org/python-bugzilla/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           https://fedorahosted.org/releases/p/y/python-bugzilla/

MODULES =                lang/python

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-bugzilla
.for d in COPYING README THANKS TODO
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-bugzilla/${d}
.endfor

.include <bsd.port.mk>

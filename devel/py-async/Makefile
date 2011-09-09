# $OpenBSD$

COMMENT =                Python module to process interdependent tasks

MODPY_EGG_VERSION =      0.6.1
REVISION =               1
DISTNAME =               async-${MODPY_EGG_VERSION}
PKGNAME =                py-async-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               http://pypi.python.org/pypi/async
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# BSD
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://pypi.python.org/packages/source/a/async/

WANTLIB +=               z

MODULES =                lang/python

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-async
.for d in AUTHORS README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-async/${d}
.endfor

.include <bsd.port.mk>

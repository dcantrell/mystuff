# $OpenBSD$

COMMENT =                Transifex translation management client tool

MODPY_EGG_VERSION =      0.5.2
REVISION =               0
DISTNAME =               transifex-client-${MODPY_EGG_VERSION}
CATEGORIES =             textproc
HOMEPAGE =               http://www.indifex.com/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://pypi.python.org/packages/source/t/transifex-client/

MODULES =                lang/python

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/transifex-client
.for d in README.rst LICENSE
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/transifex-client/${d}
.endfor

.include <bsd.port.mk>

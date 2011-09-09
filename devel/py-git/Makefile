# $OpenBSD$

COMMENT =                Python module for git version control

MODPY_EGG_VERSION =      0.3.2
DISTNAME =               GitPython-${MODPY_EGG_VERSION}.RC1
PKGNAME =                py-git-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               http://pypi.python.org/pypi/GitPython/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# BSD
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://pypi.python.org/packages/source/G/GitPython/

MODULES =                lang/python
RUN_DEPENDS +=           devel/git

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-git
.for d in AUTHORS CHANGES LICENSE
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-git/${d}
.endfor

.include <bsd.port.mk>

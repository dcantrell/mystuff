# $OpenBSD$

COMMENT =                Python module for Fedora developer tools

MODPY_EGG_VERSION =      0.3.25
DISTNAME =               python-fedora-${MODPY_EGG_VERSION}
PKGNAME =                py-fedora-${MODPY_EGG_VERSION}
CATEGORIES =             devel
HOMEPAGE =               https://fedorahosted.org/python-fedora/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           https://fedorahosted.org/releases/p/y/python-fedora/

MODULES =                lang/python
BUILD_DEPENDS +=         devel/py-babel \
                         devel/py-nose \
                         devel/py-paver \
                         devel/py-setuptools \
                         textproc/py-sphinx \
                         www/py-cherrypy2 \
                         www/py-turbogears
RUN_DEPENDS +=           databases/py-sqlalchemy \
                         devel/py-bugzilla \
                         devel/py-decorator \
                         devel/py-simplejson \
                         net/py-curl \
                         textproc/py-feedparser

MODPY_SETUPTOOLS =       Yes

PKG_ARCH =               *

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-fedora
.for d in AUTHORS COPYING ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-fedora/${d}
.endfor

.include <bsd.port.mk>

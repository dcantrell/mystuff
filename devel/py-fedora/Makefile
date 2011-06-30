COMMENT =           Python module for Fedora developer tools

MODPY_EGG_VERSION = 0.3.23
DISTNAME =          python-fedora-${MODPY_EGG_VERSION}
PKGNAME =           py-fedora-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          https://fedorahosted.org/python-fedora/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      https://fedorahosted.org/releases/p/y/python-fedora/

MODULES =           lang/python
BUILD_DEPENDS +=    devel/py-babel \
                    devel/py-nose \
                    devel/py-paver \
                    devel/py-setuptools \
                    textproc/py-sphinx \
                    www/py-cherrypy2 \
                    www/py-turbogears
RUN_DEPENDS +=      databases/py-sqlalchemy \
                    devel/py-bugzilla \
                    devel/py-decorator \
                    devel/py-simplejson \
                    net/py-curl \
                    textproc/py-feedparser

MODPY_SETUPTOOLS =  Yes

PKG_ARCH =          *

CHECK_LIB_DEPENDS = Yes

# LGPLv2.1+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-fedora
	for f in AUTHORS COPYING ChangeLog NEWS README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-fedora/$$f ; \
	done

.include <bsd.port.mk>

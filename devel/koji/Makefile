# $OpenBSD$

COMMENT =                Fedora and RHEL build system tools

MODPY_EGG_VERSION =      1.6.0
REVISION =               3
DISTNAME =               koji-${MODPY_EGG_VERSION}
EXTRACT_SUFX =           .tar.bz2
CATEGORIES =             devel
HOMEPAGE =               http://fedoraproject.org/wiki/Koji
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+ and GPLv2+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           https://fedorahosted.org/releases/k/o/koji/

MODULES =                lang/python
RUN_DEPENDS +=           misc/rpm \
                         net/py-urlgrabber \
                         security/py-krbV \
                         security/py-openssl

MODPY_SETUPTOOLS =       No

PKG_ARCH =               *

CONFIGURE_STYLE =        simple
USE_GMAKE =              Yes
NO_REGRESS =             Yes

MAKE_ENV =               PYTHON=${MODPY_BIN}

pre-configure:
	chmod +x ${WRKSRC}/configure

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/koji
.for d in Authors COPYING LGPL docs/HOWTO.html
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/koji/${d:T}
.endfor

.include <bsd.port.mk>

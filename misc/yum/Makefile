# $OpenBSD$

COMMENT =                RPM package installer/updater/manager

DISTNAME =               yum-3.4.3
CATEGORIES =             misc
HOMEPAGE =               http://yum.baseurl.org/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://yum.baseurl.org/download/3.4/

MODULES =                devel/gettext \
                         lang/python
BUILD_DEPENDS +=         textproc/intltool
RUN_DEPENDS +=           devel/py-gobject \
                         devel/py-iniparse \
                         misc/py-yum-metadata-parser \
                         misc/rpm \
                         net/py-urlgrabber \
                         security/py-gpgme \
                         x11/dbus-python

NO_REGRESS =             Yes
MODPY_SETUPTOOLS =       No
USE_GMAKE =              Yes
MAKE_ENV =               PYTHON=${MODPY_BIN}

PKG_ARCH =               *

do-build:
	@env -i ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} \
		-C ${WRKSRC} \
		-f ${MAKE_FILE} \
		${ALL_TARGET}

do-install:
	@env -i ${MAKE_ENV} ${MAKE_PROGRAM} ${ALL_FAKE_FLAGS} \
		-C ${WRKSRC} \
		-f ${MAKE_FILE} \
		${FAKE_TARGET}

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/yum
.for d in AUTHORS COPYING ChangeLog FAQ PLUGINS README TODO
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/yum/${d}
.endfor

.include <bsd.port.mk>

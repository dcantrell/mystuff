COMMENT =          RPM package installer/updater/manager

DISTNAME =         yum-3.2.29
REVISION =         0
CATEGORIES =       misc
HOMEPAGE =         http://yum.baseurl.org/
MAINTAINER =       David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =     http://yum.baseurl.org/download/3.2/

MODULES =          devel/gettext \
                   lang/python
RUN_DEPENDS +=     :py-gobject->=2.20.0:devel/py-gobject \
                   ::devel/py-iniparse \
                   :py-yum-metadata-parser->=1.1.0:misc/py-yum-metadata-parser \
                   :rpm->=4.7.2:misc/rpm \
                   ::net/py-urlgrabber \
                   ::security/py-gpgme \
                   ::x11/dbus-python

MODPY_SETUPTOOLS = No
CONFIGURE_STYLE =  simple
USE_GMAKE =        Yes
MAKE_ENV =         PYTHON=${MODPY_BIN}

PKG_ARCH =         *

REGRESS_TARGET =   test

# GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-configure:
	chmod +x ${WRKSRC}/configure

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/yum
	@for d in AUTHORS COPYING ChangeLog FAQ PLUGINS README TODO ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/yum/$$d ; \
	done

.include <bsd.port.mk>

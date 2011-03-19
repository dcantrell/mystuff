COMMENT =         linux package manager

DISTNAME =        rpm-4.7.2
EXTRACT_SUFX =    .tar.bz2
CATEGORIES =      misc
HOMEPAGE =        http://www.rpm.org/
MAINTAINER =      David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =    http://rpm.org/releases/rpm-4.7.x/

WANTLIB =         bz2 c m pthread util z
MODULES =         devel/gettext \
                  lang/python
BUILD_DEPENDS =   :autoconf-2.61:devel/autoconf/2.61 \
                  :automake-1.10.3:devel/automake/1.10
RUN_DEPENDS =     ::security/gnupg
LIB_DEPENDS =     ${MODPY_LIB_DEPENDS} \
                  ::archivers/xz \
                  ::databases/db/v4 \
                  ::devel/libmagic \
                  ::devel/popt \
                  ::lang/lua \
                  ::security/nss

MAKE_ENV +=       AUTOCONF_VERSION=2.61 \
                  AUTOMAKE_VERSION=1.10

SEPARATE_BUILD =  simple
USE_LIBTOOL =     Yes
CONFIGURE_STYLE = gnu
CONFIGURE_ARGS += --localstatedir=/var \
                  --with-external-db \
                  --with-libintl-prefix=${LOCALBASE} \
                  --enable-python \
                  --with-lua

RPM_CPPFLAGS =    -I${LOCALBASE}/include \
                  -I${LOCALBASE}/include/db4 \
                  -I${LOCALBASE}/include/nspr \
                  -I${LOCALBASE}/include/nss
RPM_LDFLAGS =     -L${LOCALBASE}/lib \
                  -L${LOCALBASE}/lib/db4 \
                  -L${LOCALBASE}/python${MODPY_VERSION}/config
CONFIGURE_ENV +=  varprefix=/usr \
                  PYTHON_VERSION=${MODPY_VERSION} \
                  GPG=${LOCALBASE}/bin/gpg \
                  CPPFLAGS="${RPM_CPPFLAGS}" \
                  LDFLAGS="${RPM_LDFLAGS}"

# See pkg/PFRAG.list
SHARED_LIBS += rpm             0.0     # 0.0
SHARED_LIBS += rpmbuild        0.0     # 0.0
SHARED_LIBS += rpmio           0.0     # 0.0

# GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-configure:
	cd ${WRKSRC} ; \
	env AUTOCONF_VERSION=2.61 AUTOMAKE_VERSION=1.10 \
	${WRKSRC}/autogen.sh --noconfigure

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/rpm
	@for d in CHANGES COPYING CREDITS ChangeLog GROUPS README TODO ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/rpm/$$d ; \
	done

.include <bsd.port.mk>

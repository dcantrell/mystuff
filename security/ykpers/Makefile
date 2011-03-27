COMMENT =         Yubikey personalization program

DISTNAME =        ykpers-1.5.0
CATEGORIES =      security
HOMEPAGE =        http://code.google.com/p/yubikey-personalization/
MAINTAINER =      David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =    http://yubikey-personalization.googlecode.com/files/

BUILD_DEPENDS =   ::devel/libusb \
                  ::devel/libyubikey

SEPARATE_BUILD =  simple
CONFIGURE_STYLE = gnu
CONFIGURE_ARGS += --with-backend=libusb

SHARED_LIBS +=    ykpers-1                  5.0 # 5.0

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/ykpers
	@for d in AUTHORS COPYING ChangeLog NEWS README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/ykpers/$$d ; \
	done

.include <bsd.port.mk>

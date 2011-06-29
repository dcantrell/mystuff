COMMENT =           Yubikey development kit

DISTNAME =          libyubikey-1.7
REVISION =          0
CATEGORIES =        devel
HOMEPAGE =          http://code.google.com/p/yubico-c/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://yubico-c.googlecode.com/files/

WANTLIB +=          c

SEPARATE_BUILD =    simple
CONFIGURE_STYLE =   gnu

CHECK_LIB_DEPENDS = Yes

# See pkg/PFRAG.share
SHARED_LIBS +=      yubikey                   1.2 # 1.2

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/libyubikey
	@for d in AUTHORS COPYING ChangeLog NEWS README THANKS ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/libyubikey/$$d ; \
	done

.include <bsd.port.mk>

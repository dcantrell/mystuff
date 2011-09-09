# $OpenBSD$

COMMENT =                Yubikey development kit

DISTNAME =               libyubikey-1.7
REVISION =               1
CATEGORIES =             devel
HOMEPAGE =               http://code.google.com/p/yubico-c/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

SHARED_LIBS +=           yubikey                   0.0

# BSD
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://yubico-c.googlecode.com/files/

WANTLIB +=               c

SEPARATE_BUILD =         simple
USE_LIBTOOL =            Yes
USE_GMAKE =              Yes
CONFIGURE_STYLE =        gnu

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/libyubikey
.for d in AUTHORS COPYING ChangeLog NEWS README THANKS
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/libyubikey/${d}
.endfor

.include <bsd.port.mk>

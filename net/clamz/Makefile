# $OpenBSD$

COMMENT =                Amazon music store download tool

DISTNAME =               clamz-0.4
CATEGORIES =             net
HOMEPAGE =               http://code.google.com/p/clamz/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://clamz.googlecode.com/files/

WANTLIB +=               c expat

MODULES =                devel/gettext
BUILD_DEPENDS =          net/curl \
                         security/libgcrypt
RUN_DEPENDS =            devel/desktop-file-utils \
                         misc/shared-mime-info

SEPARATE_BUILD =         simple
CONFIGURE_STYLE =        gnu
NO_REGRESS =             Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/clamz
.for d in COPYING README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/clamz/${d}
.endfor

.include <bsd.port.mk>

# $OpenBSD$

COMMENT =                C-based xml to sqlite metadata parser

MODPY_EGG_VERSION =      1.1.4
REVISION =               2
DISTNAME =               yum-metadata-parser-${MODPY_EGG_VERSION}
PKGNAME =                py-yum-metadata-parser-${MODPY_EGG_VERSION}
CATEGORIES =             misc
HOMEPAGE =               http://yum.baseurl.org/
MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# GPLv2
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           http://yum.baseurl.org/download/yum-metadata-parser/

MODULES =                lang/python
WANTLIB +=               sqlite3
BUILD_DEPENDS =          devel/glib2 \
                         textproc/libxml \
                         databases/sqlite3

SEPARATE_BUILD =         simple
NO_REGRESS =             Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-yum-metadata-parser
.for d in AUTHORS ChangeLog README
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-yum-metadata-parser/${d}
.endfor

.include <bsd.port.mk>

COMMENT =           tools that operate on patch files

DISTNAME =          patchutils-0.3.2
EXTRACT_SUFX =      .tar.bz2
CATEGORIES =        devel
HOMEPAGE =          http://cyberelk.net/tim/software/patchutils/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://cyberelk.net/tim/data/patchutils/stable/

WANTLIB +=          c

RUN_DEPENDS =       misc/rpm

REGRESS_DEPENDS =   misc/rpm

SEPARATE_BUILD =    simple
USE_GMAKE =         Yes

AUTOCONF_VERSION =  2.64

CONFIGURE_STYLE =   autoconf gnu
CONFIGURE_ARGS +=   --with-patch=/usr/bin/patch \
                    --with-diff=/usr/bin/diff

# GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-regress:
	ln -sf ${WRKBUILD}/src/combinediff ${WRKSRC}/src/combinediff
	ln -sf ${WRKBUILD}/src/filterdiff ${WRKSRC}/src/filterdiff
	ln -sf ${WRKBUILD}/src/flipdiff ${WRKSRC}/src/flipdiff
	ln -sf ${WRKBUILD}/src/grepdiff ${WRKSRC}/src/grepdiff
	ln -sf ${WRKBUILD}/src/interdiff ${WRKSRC}/src/interdiff
	ln -sf ${WRKBUILD}/src/lsdiff ${WRKSRC}/src/lsdiff
	ln -sf ${WRKBUILD}/src/rediff ${WRKSRC}/src/rediff

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/patchutils
	@for d in AUTHORS BUGS COPYING ChangeLog NEWS README TODO ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/patchutils/$$d ; \
	done

.include <bsd.port.mk>

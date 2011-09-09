# $OpenBSD$

COMMENT =                Tools for a Fedora maintainer environment

MODPY_EGG_VERSION =      0.5.9.2
DISTNAME =               fedora-packager-${MODPY_EGG_VERSION}
EXTRACT_SUFX =           .tar.bz2
CATEGORIES =             devel

HOMEPAGE =               https://fedorahosted.org/fedora-packager/

MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

MASTER_SITES =           https://fedorahosted.org/releases/f/e/fedora-packager/

MODULES =                lang/python
RUN_DEPENDS +=           devel/koji \
                         devel/py-argparse \
                         devel/py-fedora \
                         devel/py-gitdb \
                         devel/py-offtrac \
                         misc/rpm \
                         net/py-urlgrabber \
                         security/py-openssl

PKG_ARCH =               *

NO_REGRESS =             Yes

pre-build:
.for a in sparc arm s390 ppc
	cp -p ${WRKSRC}/src/secondary-koji ${WRKSRC}/src/${a}-koji
.endfor
.for p in fedora-burn-yubikey fedora-cert fedora-cvs fedora-hosted fedora-packager-setup fedpkg-fixbranches fedpkg
	cp -p ${WRKSRC}/src/${p}.py ${WRKSRC}/src/${p}
.endfor
	${MODPY_BIN} ${WRKSRC}/src/fedpkg_man_page.py > ${WRKSRC}/src/fedpkg.1

post-install:
	${INSTALL_MAN_DIR} ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/src/fedpkg.1 ${PREFIX}/share/man/man1/fedpkg.1
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/fedora-packager/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/src/fedpkg.bash ${PREFIX}/share/examples/fedora-packager/bash_completion.d/fedpkg.bash
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fedora-packager
.for d in AUTHORS COPYING ChangeLog NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/fedora-packager/${d}
.endfor

.include <bsd.port.mk>

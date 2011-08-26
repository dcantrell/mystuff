COMMENT =           Tools for a Fedora maintainer environment

MODPY_EGG_VERSION = 0.5.9.1
DISTNAME =          fedora-packager-${MODPY_EGG_VERSION}
EXTRACT_SUFX =      .tar.bz2
CATEGORIES =        devel
HOMEPAGE =          https://fedorahosted.org/fedora-packager/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      https://fedorahosted.org/releases/f/e/fedora-packager/

MODULES =           lang/python
RUN_DEPENDS +=      devel/koji \
                    devel/py-argparse \
                    devel/py-fedora \
                    devel/py-gitdb \
                    devel/py-offtrac \
                    rpm->=4.7.2:mystuff/misc/rpm \
                    net/py-urlgrabber \
                    security/py-openssl

PKG_ARCH =          *

NO_REGRESS =        Yes

# LGPLv2.1+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-build:
	cd ${WRKSRC} ; \
	for a in sparc arm s390 ppc ; do \
		cp -p src/secondary-koji src/$$a-koji ; \
	done ; \
	for pyfile in src/*.py ; do \
		cp -p $$pyfile src/$$(basename $$pyfile .py) ; \
	done

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/fedora-packager/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/src/fedpkg.bash ${PREFIX}/share/examples/fedora-packager/bash_completion.d/fedpkg.bash
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/fedora-packager
	@for d in AUTHORS COPYING ChangeLog NEWS README TODO ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/fedora-packager/$$d ; \
	done

.include <bsd.port.mk>

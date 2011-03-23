COMMENT =           Python module for git version control

MODPY_EGG_VERSION = 0.3.1
DISTNAME =          GitPython-${MODPY_EGG_VERSION}
PKGNAME =           py-git-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          http://pypi.python.org/pypi/GitPython/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

DISTFILES =         GitPython-${MODPY_EGG_VERSION}-beta2.tar.gz
MASTER_SITES =      http://pypi.python.org/packages/source/G/GitPython/

MODULES =           lang/python
RUN_DEPENDS +=      ::devel/git

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-git
	for f in AUTHORS CHANGES LICENSE ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-git/$$f ; \
	done

.include <bsd.port.mk>

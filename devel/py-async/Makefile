COMMENT =           Python module to process interdependent tasks

MODPY_EGG_VERSION = 0.6.1
DISTNAME =          async-${MODPY_EGG_VERSION}
PKGNAME =           py-async-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          http://pypi.python.org/pypi/async
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/a/async/

MODULES =           lang/python

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-async
	for f in AUTHORS README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-async/$$f ; \
	done

.include <bsd.port.mk>

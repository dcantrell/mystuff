COMMENT =           pure-Python git object database

MODPY_EGG_VERSION = 0.5.2
DISTNAME =          gitdb-${MODPY_EGG_VERSION}
PKGNAME =           py-gitdb-${MODPY_EGG_VERSION}
CATEGORIES =        devel
HOMEPAGE =          http://pypi.python.org/pypi/gitdb
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      http://pypi.python.org/packages/source/g/gitdb/

MODULES =           lang/python
RUN_DEPENDS +=      ::devel/py-async \
                    ::devel/py-git

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-gitdb
	for f in AUTHORS README ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/py-gitdb/$$f ; \
	done

.include <bsd.port.mk>

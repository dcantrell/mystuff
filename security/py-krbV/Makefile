COMMENT =           Python module for Kerberos 5

MODPY_EGG_VERSION = 1.0.90
DISTNAME =          python-krbV-${MODPY_EGG_VERSION}
PKGNAME =           py-krbV-${MODPY_EGG_VERSION}
EXTRACT_SUFX =      .tar.bz2
CATEGORIES =        security
HOMEPAGE =          https://fedorahosted.org/python-krbV/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

FETCH_CMD =         ftp -o ${DISTNAME}${EXTRACT_SUFX} "${HOMEPAGE}/attachment/wiki/Releases/${DISTNAME}${EXTRACT_SUFX}?format=raw"

WANTLIB =           crypto krb5
MODULES =           lang/python

SEPARATE_BUILD =    simple
NO_REGRESS =        Yes
USE_LIBTOOL =       Yes
CONFIGURE_STYLE =   gnu
CONFIGURE_ENV =     LIBS=-lcrypto \
                    WRKSRC=${WRKSRC} \
                    LIBNAME=lib

# LGPLv2.1+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-krbV
	@for d in AUTHORS COPYING ChangeLog NEWS README \
	          krbV-code-snippets.py ; do \
		${INSTALL_DATA} ${WRKSRC}/$$d ${PREFIX}/share/doc/py-krbV/$$d ; \
	done

.include <bsd.port.mk>

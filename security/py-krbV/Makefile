# $OpenBSD$

COMMENT =                Python module for Kerberos 5

MODPY_EGG_VERSION =      1.0.90
REVISION =               1
DISTNAME =               python-krbV-${MODPY_EGG_VERSION}
EXTRACT_SUFX =           .tar.bz2
PKGNAME =                py-krbV-${MODPY_EGG_VERSION}
CATEGORIES =             security

HOMEPAGE =               https://fedorahosted.org/python-krbV/

MAINTAINER =             David Cantrell <david.l.cantrell@gmail.com>

# LGPLv2.1+
PERMIT_PACKAGE_CDROM =   Yes
PERMIT_PACKAGE_FTP =     Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP =   Yes

WANTLIB +=               crypto krb5

MODULES =                lang/python

MODPY_SETUPTOOLS =       No

SEPARATE_BUILD =         simple
NO_REGRESS =             Yes
USE_LIBTOOL =            Yes
CONFIGURE_STYLE =        gnu
CONFIGURE_ENV =          LIBS=-lcrypto \
                         WRKSRC=${WRKSRC} \
                         LIBNAME=lib

# Source archive is attached to a wiki page
FETCH_MANUALLY =         "You must fetch ${DISTNAME}${EXTRACT_SUFX}"
FETCH_MANUALLY +=        "from ${HOMEPAGE} manually"
FETCH_MANUALLY +=        "and place it in ${FULLDISTDIR}"

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/py-krbV
.for d in AUTHORS COPYING ChangeLog NEWS README krbV-code-snippets.py
	${INSTALL_DATA} ${WRKSRC}/${d} ${PREFIX}/share/doc/py-krbV/${d}
.endfor

.include <bsd.port.mk>

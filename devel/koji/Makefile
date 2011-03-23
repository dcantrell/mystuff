COMMENT =           Fedora and RHEL build system tools

MODPY_EGG_VERSION = 1.6.0
DISTNAME =          koji-${MODPY_EGG_VERSION}
EXTRACT_SUFX =      .tar.bz2
CATEGORIES =        devel
HOMEPAGE =          http://pypi.python.org/pypi/GitPython/
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      https://fedorahosted.org/releases/k/o/koji/

MODULES =           lang/python
RUN_DEPENDS +=      :rpm->=4.7.2:misc/rpm \
                    ::net/py-urlgrabber \
                    ::security/py-krbV \
                    ::security/py-openssl

MODPY_SETUPTOOLS =  No
CONFIGURE_STYLE =   simple
USE_GMAKE =         Yes
NO_REGRESS =        Yes
MAKE_ENV =          PYTHON=${MODPY_BIN}

# LGPLv2.1+ and GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-configure:
	chmod +x ${WRKSRC}/configure

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/koji
	for f in Authors COPYING LGPL docs/HOWTO.html ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/koji/$$(basename $$f) ; \
	done

.include <bsd.port.mk>

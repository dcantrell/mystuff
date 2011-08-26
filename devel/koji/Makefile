COMMENT =           Fedora and RHEL build system tools

MODPY_EGG_VERSION = 1.6.0
REVISION =          2
DISTNAME =          koji-${MODPY_EGG_VERSION}
EXTRACT_SUFX =      .tar.bz2
CATEGORIES =        devel
HOMEPAGE =          http://fedoraproject.org/wiki/Koji
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

MASTER_SITES =      https://fedorahosted.org/releases/k/o/koji/

MODULES =           lang/python
# Until rpm port is updated in the ports CVS project, we cannot
# add it to the RUN_DEPENDS list.
#                   rpm->=4.9.0:misc/rpm
RUN_DEPENDS +=      net/py-urlgrabber \
                    security/py-krbV \
                    security/py-openssl

PKG_ARCH =          *

MODPY_SETUPTOOLS =  No
CONFIGURE_STYLE =   simple
USE_GMAKE =         Yes
NO_REGRESS =        Yes
MAKE_ENV =          PYTHON=${MODPY_BIN}

CHECK_LIB_DEPENDS = Yes

# LGPLv2.1+ and GPLv2+
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-configure:
	chmod +x ${WRKSRC}/configure

# HACK: Gets around limitation with /usr/ports/mystuff not overriding
# ports in the main tree.
pre-install:
	@pkg="$$(pkg_info | grep ^rpm | cut -d ' ' -f 1)" ; \
	if [ ! "$${pkg}" = "rpm-4.9.0" ]; then \
		echo "*** Missing rpm-4.9.0." ; \
		exit 1 ; \
	fi

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/koji
	for f in Authors COPYING LGPL docs/HOWTO.html ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/koji/$$(basename $$f) ; \
	done

.include <bsd.port.mk>

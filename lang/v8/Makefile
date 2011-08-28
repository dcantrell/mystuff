# Snapshot values used to check out the source from svn.
# Run ./files/checkout-v8.sh without any options to get the latest tag
# and latest svn revision (useful if updating the port).
V8_VERSION =        3.5.8
V8_SVNREV =         9030

COMMENT =           JavaScript engine

PKGNAME =           v8-${V8_VERSION}
DISTNAME =          v8-${V8_VERSION}-svn${V8_SVNREV}
CATEGORIES =        lang
HOMEPAGE =          http://code.google.com/p/v8
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

WANTLIB +=          execinfo m stdc++

LIB_DEPENDS =       devel/libexecinfo

MODULES =           devel/scons \
                    lang/python

BUILD_DEPENDS =     devel/readline \
                    textproc/icu4c

ONLY_FOR_ARCHS =    i386 amd64
NO_REGRESS =        Yes
CHECK_LIB_DEPENDS = Yes

CXXFLAGS +=         -fPIC

.if ${MACHINE} == "i386"
MODSCONS_ENV +=     arch=ia32
.elif ${MACHINE} == "amd64"
MODSCONS_ENV +=     arch=x64
.endif

MODSCONS_ENV +=     library=shared \
                    soname=on \
                    snapshot=on \
                    visibility=default \
                    console=readline

# We can actually list multiple scons targets here
ALL_TARGET =        library d8

# We have to checkout the source from svn
NO_CHECKSUM =       Yes

# BSD
PERMIT_PACKAGE_CDROM = Yes
PERMIT_PACKAGE_FTP = Yes
PERMIT_DISTFILES_CDROM = Yes
PERMIT_DISTFILES_FTP = Yes

pre-fetch:
	@if [ ! -f ${DISTDIR}/${DISTNAME}.tar.gz ]; then \
		tmpdir=$$(mktemp -d -p ${WRKDIR}) ; \
		cd $$tmpdir ; \
		${FILESDIR}/checkout-v8.sh ${V8_VERSION} ${V8_SVNREV} ; \
		${INSTALL_DATA} ${DISTNAME}.tar.gz ${DISTDIR}/${DISTNAME}.tar.gz ; \
	fi

# The forced symlinks for libv8.so and libv8preparser.so make the build
# go a little more easily when d8 is linked with the libraries.
pre-build:
	cd ${WRKSRC}/src/extensions/experimental ; \
	${MODPY_BIN} ./i18n-js2c.py i18n-libraries.cc i18n-js2c.py
	cd ${WRKSRC} ; \
	ln -sf libv8.so.${V8_VERSION} libv8.so ; \
	ln -sf libv8preparser.so.${V8_VERSION} libv8preparser.so

# There are no installation targets provided in the v8 build scripts.  You
# must install it by hand, but that's not a problem because there isn't
# a lot to install.
do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/include/v8/extensions/experimental
	${INSTALL_PROGRAM} ${WRKSRC}/d8 ${PREFIX}/bin/d8
	${INSTALL_PROGRAM} ${WRKSRC}/libv8.so.${V8_VERSION} ${PREFIX}/lib/libv8.so.${V8_VERSION}
	${INSTALL_PROGRAM} ${WRKSRC}/libv8preparser.so.${V8_VERSION} ${PREFIX}/lib/libv8preparser.so.${V8_VERSION}
	for h in ${WRKSRC}/include/*.h ; do \
		${INSTALL_DATA} $$h ${PREFIX}/include/v8/$$(basename $$h) ; \
	done
	for h in ${WRKSRC}/src/extensions/*.h ; do \
		${INSTALL_DATA} $$h ${PREFIX}/include/v8/extensions/$$(basename $$h) ; \
	done
	for h in ${WRKSRC}/src/extensions/experimental/*.h ; do \
		${INSTALL_DATA} $$h ${PREFIX}/include/v8/extensions/experimental/$$(basename $$h) ; \
	done

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/v8
	for f in AUTHORS ChangeLog LICENSE LICENSE.strongtalk LICENSE.v8 LICENSE.valgrind ; do \
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/share/doc/v8/$$f ; \
	done

.include <bsd.port.mk>

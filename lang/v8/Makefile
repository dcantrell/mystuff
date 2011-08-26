# Snapshot values used to check out the source from svn.
# Run ./files/checkout-v8.sh without any options to get the latest tag
# and latest svn revision (useful if updating the port).
V8_VERSION =        3.5.7
V8_SVNREV =         9003

COMMENT =           JavaScript engine

PKGNAME =           v8-${V8_VERSION}
DISTNAME =          v8-${V8_VERSION}-svn${V8_SVNREV}
CATEGORIES =        lang
HOMEPAGE =          http://code.google.com/p/v8
MAINTAINER =        David Cantrell <david.l.cantrell@gmail.com>

WANTLIB +=          c curses m pthread stdc++

MODULES =           devel/scons \
                    lang/python

BUILD_DEPENDS =     devel/readline \
                    textproc/icu4c

CHECK_LIB_DEPENDS = Yes
ONLY_FOR_ARCHS =    i386 amd64
NO_REGRESS =        Yes
CHECK_LIB_DEPENDS = Yes

CXXFLAGS +=         -fPIC

.if ${PKG_ARCH:L} == "i386"
MODSCONS_ENV +=     arch=ia32
.elif ${PKG_ARCH:L} == "amd64"
MODSCONS_ENV +=     arch=x64
.endif

MODSCONS_ENV +=     library=shared \
                    soname=on \
                    snapshot=on \
                    visibility=default \
                    console=readline

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

pre-build:
	cd ${WRKSRC}/src/extensions/experimental ; \
	${MODPY_BIN} ./i18n-js2c.py i18n-libraries.cc i18n-js2c.py

#do-build:
#	@cd ${WRKSRC} ; \
#	scons \
#		arch=$$platform library=shared soname=on \
#		snapshot=on visibility=default ; \
#	ln -sf libv8.so.${V8_VERSION} libv8.so ; \
#	ln -sf libv8preparser.so.${V8_VERSION} libv8preparser.so ; \
#	scons d8 \
#		arch=$$platform library=shared soname=on \
#		console=readline visibility=default

# There are no installation targets provided in the v8 build tools.  You
# must install it by hand, but that's not a problem because there isn't
# a lot to install.
do-install:
	${INSTALL_DATA_DIR} ${PREFIX}/include/v8/extensions/experimental
	${INSTALL_PROGRAM} ${WRKSRC}/d8 ${PREFIX}/bin/d8
	echo "LIBTOOL: |${LIBTOOL}"
	exit 1
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} -g wheel ${WRKSRC}/libv8.so.${V8_VERSION} ${PREFIX}/lib/libv8.so.${V8_VERSION}
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} -g wheel ${WRKSRC}/libv8preparser.so.${V8_VERSION} ${PREFIX}/lib/libv8preparser.so.${V8_VERSION}
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

# /usr/ports/mystuff Makefile
#
# Copyright (C) 2011 David Cantrell <david.l.cantrell@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Commands (prevent /usr/local/bin or ~/bin overrides)
BASENAME =     /usr/bin/basename
CUT =          /usr/bin/cut
ECHO =         /bin/echo
ENV =          /usr/bin/env
FIND =         /usr/bin/find
GREP =         /usr/bin/grep
GZIP =         /usr/bin/gzip
MACHINE =      /usr/bin/machine
MKTEMP =       /usr/bin/mktemp
MV =           /bin/mv
RM =           /bin/rm
RSYNC =        /usr/local/bin/rsync -avz --progress
SORT =         /usr/bin/sort
SSH =          /usr/bin/ssh
TAR =          /bin/tar
UNAME =        /usr/bin/uname

# List of all ports in this project
PORTS !=       ${FIND} . -type d -maxdepth 2 | \
               ${GREP} -E "\/.+\/" | \
               ${GREP} -v "\.git" | \
               while read f ; do ${ECHO} $${f} | ${CUT} -c3- ; done

# Any target can use PORTSTMP, but it's removed after each target is run
PORTSTMP !=    ${MKTEMP} -d -p ${PWD}

# System and release specific information
RELEASE !=     ${UNAME} -r
MACHINE !=     ${MACHINE} -a

# Use the first port to collect ports system settings
_FIRSTPORT !=  ${ECHO} ${PORTS} | ${CUT} -d ' ' -f 1
FULLDISTDIR != ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=FULLDISTDIR )
PORTSDIR !=    ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=PORTSDIR )
PKGREPO !=     ( cd ${PWD}/${_FIRSTPORT} && ${MAKE} show=PACKAGE_REPOSITORY )
MYSTUFFROOT =  ${PORTSDIR}/mystuff

# Publishing location
SITEHOST =     site5
SITEROOT =     public_html/openbsd/mystuff

all:
	@${ECHO} "Specify a target:"
	@${ECHO} "    publish           Publish source and packages."
	@${ECHO} "    publish-source    Publish port sources as .tar.gz files per port."
	@${ECHO} "    publish-packages  Publish built packages per port."
	@${ECHO} "    list              Show list of all ports in this tree."
	@${ECHO} "    SHA1              Generate new SHA1 files on ${SITEHOST}."

publish: publish-source publish-distfiles publish-packages
	@${RSYNC} README ${SITEHOST}:${SITEROOT}

publish-source:
	@${SSH} ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/src
.for port in ${PORTS}
	@${ENV} PORT="SOURCE: ${port}" ${MAKE} _show-header
.if exists(${MYSTUFFROOT}/${port}/.ignore)
	@${ECHO} "Ignoring ${port}"
.else
	@${ENV} PORT=${port} ${MAKE} _src-archive
	@${ENV} PORT=${port} ${MAKE} _upload-src-archive
.endif
.endfor

publish-distfiles:
	@${SSH} ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/distfiles
.for port in ${PORTS}
	@${ENV} PORT="DISTFILES: ${port}" ${MAKE} _show-header
.if exists(${MYSTUFFROOT}/${port}/.ignore)
	@${ECHO} "*** Ignoring ${port}"
.else
	@${ENV} DISTFILES="$$(cd ${MYSTUFFROOT}/${port} && ${MAKE} show=DISTFILES)" ${MAKE} _publish-port-distfiles
.endif
.endfor

publish-packages:
	@${SSH} ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/packages/${MACHINE}
.for port in ${PORTS}
.if exists(${MYSTUFFROOT}/${port}/.ignore)
	@${ECHO} "*** Ignoring ${port}"
.else
	@${ENV} PORT=${port} ${MAKE} _publish_package
.endif
.endfor

SHA1:
	@${ENV} SUBDIR="src" DESC="source archives" MASK="*.tar.gz" ${MAKE} _digest_file
	@${ENV} SUBDIR="distfiles" DESC="distfiles" MASK="*" ${MAKE} _digest_file
	@${ENV} SUBDIR="packages/${MACHINE}" DESC="packages" MASK="*.tgz" ${MAKE} _digest_file

list:
.for port in ${PORTS}
.if exists(${MYSTUFFROOT}/${port}/.ignore)
	@${ECHO} "${port} (ignored)"
.else
	@${ECHO} "${port}"
.endif
.endfor

_show-header:
	@${ECHO} -n "+-"
	@${ECHO} -n "${PORT}" | sed -e 's/./-/g'
	@${ECHO} "-+"
	@${ECHO} "| ${PORT} |"
	@${ECHO} -n "+-"
	@${ECHO} -n "${PORT}" | sed -e 's/./-/g'
	@${ECHO} "-+"

_digest_file:
	@${SSH} ${SITEHOST} mkdir -p ${SITEROOT}/${RELEASE}/${SUBDIR}
	@${ECHO} "Generating SHA-1 digests for ${DESC}..."
	@${ENV} FILES="$$(${SSH} ${SITEHOST} ls -1 ${SITEROOT}/${RELEASE}/${SUBDIR}/${MASK} | grep -v SHA1)" ${MAKE} _digest_per_file

_digest_per_file:
.for f in ${FILES}
	@${ECHO} "    $$(${BASENAME} ${f})"
	@${SSH} ${SITEHOST} "( cd ${SITEROOT}/${RELEASE}/${SUBDIR} ; openssl dgst -sha1 $$(${BASENAME} ${f}) )" >> ${PORTSTMP}/SHA1
.endfor
	@${SORT} ${PORTSTMP}/SHA1 > ${PORTSTMP}/SHA1.new
	@${MV} ${PORTSTMP}/SHA1.new ${PORTSTMP}/SHA1
	@${RSYNC} ${PORTSTMP}/SHA1 ${SITEHOST}:${SITEROOT}/${RELEASE}/${SUBDIR}

_src-archive:
	@${TAR} -cvpf - ${PORT} | ${GZIP} -9c > ${PORTSTMP}/${PORT:T}.tar.gz
	@${MV} ${PORTSTMP}/${PORT:T}.tar.gz ${PWD}

_upload-src-archive:
	@${RSYNC} ${PWD}/${PORT:T}.tar.gz ${SITEHOST}:${SITEROOT}/${RELEASE}/src/${PORT:T}.tar.gz
	@${RM} -f ${PWD}/${PORT:T}.tar.gz

_publish-port-distfiles:
.for distfile in ${DISTFILES}
.if exists(${FULLDISTDIR}/${distfile})
	@${RSYNC} ${FULLDISTDIR}/${distfile} ${SITEHOST}:${SITEROOT}/${RELEASE}/distfiles/${distfile}
.else
	@${ECHO} "*** Missing ${FULLDISTDIR}/${distfile}"
.endif
.endfor

_publish_package:
	@${ENV} PKG="$$(cd ${MYSTUFFROOT}/${PORT} ; ${MAKE} show=FULLPKGNAME)" ${MAKE} _upload_package
	@${ENV} PORT=${PORT} FLAVORS="$$(cd ${MYSTUFFROOT}/${PORT} ; ${MAKE} show=FLAVORS)" ${MAKE} _upload_package_flavors

_upload_package:
.if exists(${PKGREPO}/${MACHINE}/ftp/${PKG}.tgz)
	@${RSYNC} ${PKGREPO}/${MACHINE}/ftp/${PKG}.tgz ${SITEHOST}:${SITEROOT}/${RELEASE}/packages/${MACHINE}
.else
	@${ECHO} "*** Missing ${PKGREPO}/${MACHINE}/ftp/${PKG}.tgz"
.endif

_upload_package_flavors:
.for flavor in ${FLAVORS}
	@${ENV} PKG="$$(cd ${MYSTUFFROOT}/${PORT} ; ${ENV} FLAVOR=${flavor} ${MAKE} show=FULLPKGNAME)" _upload_package
.endfor

.END:
	@${RM} -rf ${PORTSTMP}

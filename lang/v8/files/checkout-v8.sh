#!/bin/ksh
#
# Checkout the most recent v8 tag from svn and create a tar.gz of it.
# Author: David Cantrell <david.l.cantrell@gmail.com>
#

PATH=/bin:/usr/bin:/usr/local/bin

# Optional arguments:
#     $1     Version (svn tag) to check out.
#     $2     svn revision to check out.
# If the arguments are not specified, the script will check out the
# most recent tag and most recent revision (not the trunk).
VERSION="${1}"
SVNREV="${2}"

CWD="$(pwd)"
REPO=http://v8.googlecode.com/svn
TMP="$(mktemp -d -p $(pwd))"

cd ${TMP}

if [ -z "${VERSION}" ]; then
    VERSION="$(svn ls ${REPO}/tags/ | tail -n 1 | cut -d '/' -f 1)"
fi

if [ -z "${SVNREV}" ]; then
    svn co ${REPO}/tags/${VERSION}/ v8-${VERSION}
    cd v8-${VERSION}
    SVNREV="$(svnversion)"
    rm -rf .gitignore
    find . -type d -name .svn | xargs rm -rf
    cd ${TMP}
else
    svn export -r ${SVNREV} ${REPO}/tags/${VERSION}/ v8-${VERSION}
fi

SNAPSHOT="${VERSION}-svn${SVNREV}"
mv v8-${VERSION} v8-${SNAPSHOT}
tar -cvf - v8-${SNAPSHOT} | gzip -9c > ${CWD}/v8-${SNAPSHOT}.tar.gz
cd ${CWD}
rm -rf ${TMP}

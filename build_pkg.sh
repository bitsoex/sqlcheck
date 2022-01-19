#!/usr/bin/env bash

set -o nounset

SQLCHECK_PACKAGE_DIR=${SQLCHECK_PACKAGE_NAME}_${SQLCHECK_PACKAGE_VERSION}_${SQLCHECK_PACKAGE_ARCH}
SQLCHECK_PACKAGE_CONTROL_FILE=${SQLCHECK_PACKAGE_DIR}/DEBIAN/control

mkdir -p ${SQLCHECK_PACKAGE_DIR}/usr/local/bin ${SQLCHECK_PACKAGE_DIR}/DEBIAN
cp /usr/local/bin/sqlcheck /usr/local/bin/libsqlcheck_library.a ${SQLCHECK_PACKAGE_DIR}/usr/local/bin/

cat > ${SQLCHECK_PACKAGE_CONTROL_FILE} << EOF
Package: ${SQLCHECK_PACKAGE_NAME}
Version: ${SQLCHECK_PACKAGE_VERSION}
Architecture: ${SQLCHECK_PACKAGE_ARCH}
Maintainer: Joy Arulraj
Description: Automatically identify anti-patterns in SQL queries.
EOF

dpkg-deb --build --root-owner-group ${SQLCHECK_PACKAGE_DIR}

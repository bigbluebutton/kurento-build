#!/bin/bash

set -e

NAME=$1

mkdir -p /build

if [[ -d /build/$NAME ]]; then
  rm -rf /build/$NAME
fi

cp -R /kms/$NAME /build/
cd /build/$NAME

if [[ -f /patches/$NAME.patch ]]; then
  envsubst '$ARCH' </patches/$NAME.patch | patch -p1
fi

source /etc/lsb-release
PACKAGE_VERSION="$(dpkg-parsechangelog --show-field Version)"

mk-build-deps --install --remove \
    --tool="apt-get -o Debug::pkgProblemResolver=yes --target-release '*-backports' --no-install-recommends --no-remove --yes" \
    ./debian/control

gbp dch \
        --ignore-branch \
        --git-author \
        --spawn-editor=never \
        --new-version="${PACKAGE_VERSION}.${DISTRIB_RELEASE}" \
        --release \
        ./debian/

GBP_BUILDER="debuild --preserve-env --no-tgz-check -i -I"

GBP_ARGS=()
GBP_ARGS+=("-uc")
GBP_ARGS+=("-us")
GBP_ARGS+=("-j$(nproc)")

export CTEST_OUTPUT_ON_FAILURE=1

DEB_CFLAGS_SET="-Wno-address-of-packed-member" \
DEB_BUILD_OPTIONS=nocheck \
gbp buildpackage \
    --git-ignore-new \
    --git-ignore-branch \
    --git-upstream-tree=SLOPPY \
    --git-builder="$GBP_BUILDER" \
    ${GBP_ARGS[@]+"${GBP_ARGS[@]}"}

mv /build/*.deb /packages/

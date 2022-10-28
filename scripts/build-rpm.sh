#!/bin/bash -ix

set -e

source /scripts/build-common.sh


PACKAGE_VERSION="$(head -1 debian/changelog | awk -F'[()]' '{print $2}' | awk -F'-' '{print $1}')"

if [[ -f /rpm/SPECS/$NAME.spec ]]; then
  SPEC=$NAME.spec
else
  SPEC=kms-$NAME.spec
fi

yumbd /rpm/SPECS/$SPEC
rpmbb --define "package_version $PACKAGE_VERSION" --define "package_dir $NAME" /rpm/SPECS/$SPEC

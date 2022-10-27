#!/bin/bash

set -e

export KURENTO_VERSION=$(cat /KURENTO_VERSION)

export DEBIAN_FRONTEND=noninteractive
export ARCH=$(arch)

if [[ $(arch) == x86_64 ]]; then
  rm -f /etc/apt/sources.list.d/bionic-ports.list
else
  rm -f /etc/apt/sources.list.d/bionic.list
fi

source /etc/lsb-release

apt-get update
apt-get -y install libssl1.0.0

if [[ ${DISTRIB_RELEASE%%.*} -ge 18 ]]; then
    mkdir -p /tmp/custom
    pushd /tmp/custom

    # Remove conflict from libcurl4
    apt-get download libcurl4
    dpkg-deb -R libcurl4_*.deb libcurl4/
    sed -i '/^Conflicts: libcurl3/d' libcurl4/DEBIAN/control
    dpkg-deb -b libcurl4 libcurl4-custom.deb
    dpkg -i libcurl4-custom.deb

    apt-get download libcurl4-openssl-dev
    dpkg-deb -R libcurl4-openssl-dev_*.deb libcurl4-openssl-dev/
    sed -i 's/, libssl1.0-dev//g' libcurl4-openssl-dev/DEBIAN/control
    dpkg-deb -b libcurl4-openssl-dev libcurl4-openssl-dev-custom.deb
    dpkg -i libcurl4-openssl-dev-custom.deb

    # Remove conflict from libcurl3 and leave this as the installed version
    apt-get download libcurl3
    dpkg-deb -R libcurl3_*.deb libcurl3/
    sed -i '/^Conflicts: libcurl4/d' libcurl3/DEBIAN/control
    dpkg-deb -b libcurl3 libcurl3-custom.deb
    dpkg -i libcurl3-custom.deb

    popd # /tmp
    rm -rf /tmp/custom
fi

cd /kms

build-deb.sh openh264
apt-get -y install /packages/openh264_1.5.0-*.deb

build-deb.sh jsoncpp
apt-get -y install /packages/kmsjsoncpp{,-dev}_1.6.3-*.deb

build-deb.sh libusrsctp
apt-get -y install /packages/libusrsctp{,-dev}_0.9.2-*.deb

build-deb.sh gstreamer
apt-get -y install /packages/gir1.2-gstreamer-1.5_1.8.1-*.deb /packages/libgstreamer1.5-{0,dev}_1.8.1-*.deb

build-deb.sh gst-plugins-base
apt-get -y install /packages/gir1.2-gst-plugins-base-1.5_1.8.1-*.deb /packages/libgstreamer-plugins-base1.5-{0,dev}_1.8.1-*.deb \
  /packages/gstreamer1.5-plugins-base_1.8.1-*.deb \
  /packages/gstreamer1.5-{alsa,x}_1.8.1-*.deb

build-deb.sh gst-plugins-good
apt-get -y install /packages/gstreamer1.5-pulseaudio_1.8.1-*.deb /packages/gstreamer1.5-plugins-good_1.8.1-*.deb

build-deb.sh openh264-gst-plugin
apt-get -y install /packages/openh264-gst-plugin_1.0.0-*.deb

apt-get -y remove libssl-dev
build-deb.sh libsrtp
apt-get -y install /packages/libsrtp0{,-dev}_1.6.0-*.deb

apt-get -y remove libcurl4-gnutls-dev
build-deb.sh gst-plugins-bad
apt-get -y install /packages/gir1.2-gst-plugins-bad-1.5_1.8.1-*.deb /packages/libgstreamer-plugins-bad1.5-{0,dev}_1.8.1-*.deb \
  /packages/gstreamer1.5-plugins-bad_1.8.1-*.deb \
  /packages/openh264-gst-plugins-bad-1.5_1.8.1-*.deb

apt-get -y install libx264-dev=2:0.152.\*
build-deb.sh gst-plugins-ugly
apt-get -y install /packages/gstreamer1.5-plugins-ugly_1.8.1-*.deb


build-deb.sh gst-libav
apt-get -y install /packages/gstreamer1.5-libav_1.8.1-*.deb

build-deb.sh openwebrtc-gst-plugins
apt-get -y install /packages/openwebrtc-gst-plugins{,-dev}_0.10.0-*.deb

build-deb.sh libnice
apt-get -y install /packages/gir1.2-nice-0.1_0.1.18-*.deb /packages/gstreamer1.5-nice_0.1.18-*.deb \
  /packages/libnice{10,-dev}_0.1.18-*.deb

apt-get -y install libcurl3-gnutls

cp -R /kms/.git* /build/
build-deb.sh kms-cmake-utils
apt-get -y install /packages/kms-cmake-utils_${KURENTO_VERSION}-*.deb

build-deb.sh kurento-module-creator
apt-get -y install /packages/kurento-module-creator_${KURENTO_VERSION}-*.deb

build-deb.sh kms-jsonrpc
apt-get -y install /packages/kms-jsonrpc{,-dev}_${KURENTO_VERSION}-*.deb

build-deb.sh kms-core
apt-get -y install /packages/kms-core{,-dev}_${KURENTO_VERSION}-*.deb

build-deb.sh kms-elements
apt-get -y install /packages/kms-elements{,-dev}_${KURENTO_VERSION}-*.deb

build-deb.sh kms-filters
apt-get -y install /packages/kms-filters{,-dev}_${KURENTO_VERSION}-*.deb

apt-get -y --allow-downgrades install libwebsocketpp-dev=0.7.0\*
build-deb.sh kurento-media-server
apt-get -y install /packages/kurento-media-server{,-dev}_${KURENTO_VERSION}-*.deb

cd /packages
mkdir -p dbg
mv *-dbg*.deb dbg/

mkdir -p dev
mv *-dev*.deb dev/
mv kms-cmake-utils_${KURENTO_VERSION}-*.deb dev/

mkdir -p deps
cd deps
apt-get download \
  libboost-filesystem1.65.1 \
  libboost-log1.65.1 \
  libboost-program-options1.65.1 \
  libboost-regex1.65.1 \
  libboost-system1.65.1 \
  libboost-thread1.65.1 \
  libicu60 \
  libmimic0 \
  libssl1.0.0 \
  libx264-152

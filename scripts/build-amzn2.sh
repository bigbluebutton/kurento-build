#!/bin/bash -i

set -e

KURENTO_VERSION=$(cat /KURENTO_VERSION)

export PATH=/scripts:$PATH

cat >/etc/yum.repos.d/kurento.repo <<EOF
[kurento]
name=Kurento
baseurl=file:///packages/
gpgcheck=0
enabled=1
EOF

yumi kms-boost \
  kms-boost-atomic \
  kms-boost-context \
  kms-boost-coroutine \
  kms-boost-date-time \
  kms-boost-devel \
  kms-boost-filesystem \
  kms-boost-math \
  kms-boost-random \
  kms-boost-regex \
  kms-boost-serialization \
  kms-boost-system \
  kms-boost-test \
  kms-boost-thread \
  kms-boost-timer \
  kms-boost-chrono \
  kms-boost-locale \
  kms-boost-log \
  kms-boost-python \
  kms-boost-graph \
  kms-boost-signals \
  kms-boost-iostreams \
  kms-boost-program-options \
  kms-boost-wave

yumi automake --disablerepo=* --enablerepo=kurento
yumi libogg-devel
yumi opus-devel libvpx-devel --disablerepo=* --enablerepo=kurento

cd /rpm/SPECS

build-rpm.sh jsoncpp
yumi /packages/x86_64/kms-jsoncpp-1.6.3-1.*.x86_64.rpm /packages/x86_64/kms-jsoncpp-devel-1.6.3-1.*.x86_64.rpm

build-rpm.sh libsrtp
yumi /packages/x86_64/kms-libsrtp-1.6.0-0.*.x86_64.rpm /packages/x86_64/kms-libsrtp-devel-1.6.0-0.*.x86_64.rpm

build-rpm.sh libusrsctp
yumi /packages/x86_64/kms-libusrsctp-0.9.2-1.*.x86_64.rpm /packages/x86_64/kms-libusrsctp-devel-0.9.2-1.*.x86_64.rpm

build-rpm.sh gstreamer
yumi /packages/x86_64/kms-gstreamer1-1.8.1-2.*.x86_64.rpm /packages/x86_64/kms-gstreamer1-devel-1.8.1-2.*.x86_64.rpm

build-rpm.sh gst-plugins-base
yumi /packages/x86_64/kms-gstreamer1-plugins-base-1.8.1-2.*.x86_64.rpm /packages/x86_64/kms-gstreamer1-plugins-base-devel-1.8.1-2.*.x86_64.rpm

build-rpm.sh gst-plugins-bad
yumi /packages/x86_64/kms-gstreamer1-plugins-bad-1.8.1-5.*.x86_64.rpm /packages/x86_64/kms-gstreamer1-plugins-bad-devel-1.8.1-5.*.x86_64.rpm

build-rpm.sh gst-plugins-good
yumi /packages/x86_64/kms-gstreamer1-plugins-good-1.8.1-5.*.x86_64.rpm

build-rpm.sh gst-plugins-ugly
yumi /packages/x86_64/kms-gstreamer1-plugins-ugly-1.8.1-1.*.x86_64.rpm

build-rpm.sh gst-libav
yumi /packages/x86_64/kms-gstreamer1-libav-1.8.1-1.*.x86_64.rpm

build-rpm.sh openwebrtc-gst-plugins
yumi /packages/x86_64/kms-openwebrtc-gst-plugins-0.10.0-1.*.x86_64.rpm /packages/x86_64/kms-openwebrtc-gst-plugins-devel-0.10.0-1.*.x86_64.rpm

yumi python3-pip python3 python3-setuptools python3-devel python-rpm-macros
yumbd meson.spec
rpmbb meson.spec
yumi /packages/noarch/meson-0.55.1-1.*.noarch.rpm

build-rpm.sh libnice
yumi /packages/x86_64/kms-libnice-0.1.18-0.*.x86_64.rpm /packages/x86_64/kms-libnice-devel-0.1.18-0.*.x86_64.rpm

build-rpm.sh kurento-module-creator
yumi /packages/x86_64/kurento-module-creator-*.x86_64.rpm

build-rpm.sh kms-cmake-utils
yumi /packages/x86_64/kms-cmake-utils-${KURENTO_VERSION}-0.*.x86_64.rpm

build-rpm.sh kms-jsonrpc
yumi /packages/x86_64/kms-jsonrpc-${KURENTO_VERSION}-0.*.x86_64.rpm /packages/x86_64/kms-jsonrpc-devel-${KURENTO_VERSION}-0.*.x86_64.rpm

build-rpm.sh kms-core
yumi /packages/x86_64/kms-core-${KURENTO_VERSION}-0.*.x86_64.rpm /packages/x86_64/kms-core-devel-${KURENTO_VERSION}-0.*.x86_64.rpm

build-rpm.sh kms-elements
yumi /packages/x86_64/kms-elements-${KURENTO_VERSION}-0.*.x86_64.rpm /packages/x86_64/kms-elements-devel-${KURENTO_VERSION}-0.*.x86_64.rpm

build-rpm.sh kms-filters
yumi /packages/x86_64/kms-filters-${KURENTO_VERSION}-0.*.x86_64.rpm /packages/x86_64/kms-filters-devel-${KURENTO_VERSION}-0.*.x86_64.rpm

yumi websocketpp-devel --disablerepo=* --enablerepo=kurento

build-rpm.sh kurento-media-server
yumi /packages/x86_64/kurento-media-server-${KURENTO_VERSION}-0.*.x86_64.rpm

rpmbb kms.spec
yumi /packages/x86_64/kms-${KURENTO_VERSION}-0.*.x86_64.rpm

yumi createrepo_c --disablerepo=* --enablerepo=kurento
createrepo_c --update --simple-md-filenames /packages
yum clean metadata

# GST_DEBUG="3,Kurento*:4,kms*:4" GST_DEBUG_NO_COLOR=1 LD_LIBRARY_PATH=/opt/kms/lib64 kurento-media-server -d /var/log/kurento -n 5
#
# GST_DEBUG="3,Kurento*:4,kms*:4" GST_DEBUG_NO_COLOR=1 kurento-media-server -d /var/log/kurento -n 5

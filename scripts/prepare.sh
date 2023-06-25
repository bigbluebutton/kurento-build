#!/bin/sh

KURENTO_VERSION=$(cat KURENTO_VERSION)

export DEBIAN_FRONTEND=noninteractive

pushd /kms
git rev-parse --is-inside-work-tree && exit 0 || popd

git clone https://github.com/Kurento/kms-omni-build.git kms
cd kms
git submodule update --init --recursive
git submodule update --remote

git checkout "$KURENTO_VERSION" || true
git submodule foreach "git checkout $KURENTO_VERSION || true"

git clone https://github.com/Kurento/openh264.git
git clone https://github.com/Kurento/jsoncpp.git
git clone https://github.com/Kurento/libsrtp.git
git clone https://github.com/Kurento/libusrsctp.git
git clone https://github.com/Kurento/gstreamer.git
git clone https://github.com/Kurento/gst-plugins-base.git
git clone https://github.com/Kurento/gst-plugins-bad.git
git clone https://github.com/Kurento/gst-plugins-good.git
git clone https://github.com/Kurento/gst-plugins-ugly.git
git clone https://github.com/Kurento/gst-libav.git
git clone https://github.com/Kurento/openwebrtc-gst-plugins.git
git clone https://github.com/Kurento/openh264-gst-plugin.git
git clone https://github.com/Kurento/libnice.git

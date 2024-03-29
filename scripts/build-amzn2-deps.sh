#!/bin/bash -i

set -e

cd /rpm/SPECS

for spec in `ls *.spec`; do
    rpmsrc $spec
done

rpmbb opencore-amr.spec
yumi /packages/x86_64/opencore-amr-0.1.3-4.*.x86_64.rpm /packages/x86_64/opencore-amr-devel-0.1.3-4.*.x86_64.rpm

rpmbb vo-aacenc.spec vo-amrwbenc.spec
yumi /packages/x86_64/vo-aacenc-0.1.2-3.*.x86_64.rpm /packages/x86_64/vo-aacenc-devel-0.1.2-3.*.x86_64.rpm /packages/x86_64/vo-amrwbenc-0.1.3-2.*.x86_64.rpm /packages/x86_64/vo-amrwbenc-devel-0.1.3-2.*.x86_64.rpm

yumbd x265.spec
rpmbb x265.spec
yumi /packages/x86_64/x265-libs-2.9-3.*.x86_64.rpm /packages/x86_64/x265-devel-2.9-3.*.x86_64.rpm

rpmbb xvidcore.spec
yumi /packages/x86_64/xvidcore-1.3.4-2.*.x86_64.rpm /packages/x86_64/xvidcore-devel-1.3.4-2.*.x86_64.rpm

rpmbb fdk-aac.spec
yumi /packages/x86_64/fdk-aac-0.1.5-0.1.gita0bd8aa.*.x86_64.rpm /packages/x86_64/fdk-aac-devel-0.1.5-0.1.gita0bd8aa.*.x86_64.rpm

yumbd faad2.spec
rpmbb faad2.spec
yumi /packages/x86_64/faad2-libs-2.7-9.*.x86_64.rpm /packages/x86_64/faad2-devel-2.7-9.*.x86_64.rpm

yumbd x264.spec --define '_with_bootstrap 1'
rpmbb x264.spec --define '_with_bootstrap 1'
yumi /packages/x86_64/x264-libs-0.148-23.20170521gitaaa9aa8_bootstrap.*.x86_64.rpm /packages/x86_64/x264-devel-0.148-23.20170521gitaaa9aa8_bootstrap.*.x86_64.rpm

yumbd libva.spec
rpmbb libva.spec
yumi /packages/x86_64/libva-1.8.3-1.*.x86_64.rpm /packages/x86_64/libva-devel-1.8.3-1.*.x86_64.rpm

yumbd opus.spec
rpmbb opus.spec
yumi /packages/x86_64/opus-1.1.3-1.*.x86_64.rpm /packages/x86_64/opus-devel-1.1.3-1.*.x86_64.rpm

yumbd libvpx.spec
rpmbb libvpx.spec
yumi /packages/x86_64/libvpx-1.7.0-8.*.x86_64.rpm /packages/x86_64/libvpx-devel-1.7.0-8.*.x86_64.rpm

yumbd ffmpeg.spec
rpmbb ffmpeg.spec
yumi /packages/x86_64/ffmpeg-libs-4.2.4-1.*.x86_64.rpm /packages/x86_64/libavdevice-4.2.4-1.*.x86_64.rpm /packages/x86_64/ffmpeg-devel-4.2.4-1.*.x86_64.rpm

yumbd gpac.spec
rpmbb gpac.spec

yumi /packages/x86_64/gpac-libs-0.7.1-8.*.x86_64.rpm /packages/x86_64/gpac-devel-0.7.1-8.*.x86_64.rpm

rpmbb x264.spec
rpm -ev x264-devel x264-libs --nodeps
yumi /packages/x86_64/x264-libs-0.148-23.20170521gitaaa9aa8.*.x86_64.rpm /packages/x86_64/x264-devel-0.148-23.20170521gitaaa9aa8.*.x86_64.rpm

yumbd libde265.spec
rpmbb libde265.spec
yumi /packages/x86_64/libde265-1.0.2-6.*.x86_64.rpm /packages/x86_64/libde265-devel-1.0.2-6.*.x86_64.rpm

yumbd automake.spec
rpmbb automake.spec
yumi /packages/noarch/automake-1.15-9.*.noarch.rpm

yumbd rtmpdump.spec
rpmbb rtmpdump.spec
yumi /packages/x86_64/librtmp-2.4-7.20160224.gitfa8646d.*.x86_64.rpm /packages/x86_64/librtmp-devel-2.4-7.20160224.gitfa8646d.*.x86_64.rpm

yumbd openh264.spec
rpmbb openh264.spec
yumi /packages/x86_64/openh264-1.5.0-4.*.x86_64.rpm /packages/x86_64/openh264-devel-1.5.0-4.*.x86_64.rpm

yumbd kms-openjpeg2.spec
rpmbb kms-openjpeg2.spec
yumi /packages/x86_64/kms-openjpeg2-2.1.0-7.*.x86_64.rpm /packages/x86_64/kms-openjpeg2-devel-2.1.0-7.*.x86_64.rpm

yumbd kms-boost.spec
rpmbb kms-boost.spec --without python3

pushd /packages/x86_64
yumi kms-boost-1.55.0-12.*.x86_64.rpm \
  kms-boost-atomic-1.55.0-12.*.x86_64.rpm \
  kms-boost-context-1.55.0-12.*.x86_64.rpm \
  kms-boost-coroutine-1.55.0-12.*.x86_64.rpm \
  kms-boost-date-time-1.55.0-12.*.x86_64.rpm \
  kms-boost-devel-1.55.0-12.*.x86_64.rpm \
  kms-boost-filesystem-1.55.0-12.*.x86_64.rpm \
  kms-boost-math-1.55.0-12.*.x86_64.rpm \
  kms-boost-random-1.55.0-12.*.x86_64.rpm \
  kms-boost-regex-1.55.0-12.*.x86_64.rpm \
  kms-boost-serialization-1.55.0-12.*.x86_64.rpm \
  kms-boost-system-1.55.0-12.*.x86_64.rpm \
  kms-boost-test-1.55.0-12.*.x86_64.rpm \
  kms-boost-thread-1.55.0-12.*.x86_64.rpm \
  kms-boost-timer-1.55.0-12.*.x86_64.rpm \
  kms-boost-chrono-1.55.0-12.*.x86_64.rpm \
  kms-boost-locale-1.55.0-12.*.x86_64.rpm \
  kms-boost-log-1.55.0-12.*.x86_64.rpm \
  kms-boost-python-1.55.0-12.*.x86_64.rpm \
  kms-boost-graph-1.55.0-12.*.x86_64.rpm \
  kms-boost-signals-1.55.0-12.*.x86_64.rpm \
  kms-boost-iostreams-1.55.0-12.*.x86_64.rpm \
  kms-boost-program-options-1.55.0-12.*.x86_64.rpm \
  kms-boost-wave-1.55.0-12.*.x86_64.rpm
popd

yumbd websocketpp.spec
rpmbb websocketpp.spec
yumi /packages/noarch/websocketpp-devel-0.8.2-4.*.noarch.rpm

yumi python3-pip python3 python3-setuptools python3-devel python-rpm-macros
yumbd meson.spec
rpmbb meson.spec
yumi /packages/noarch/meson-0.55.1-1.*.noarch.rpm

yumbd drpm.spec
rpmbb drpm.spec
yumi /packages/x86_64/drpm-0.5.0-1.*.x86_64.rpm /packages/x86_64/drpm-devel-0.5.0-1.*.x86_64.rpm

yumbd createrepo_c.spec
rpmbb createrepo_c.spec
yumi /packages/x86_64/createrepo_c-0.17.1-1.*.x86_64.rpm /packages/x86_64/createrepo_c-libs-0.17.1-1.*.x86_64.rpm

createrepo_c --update --simple-md-filenames /packages

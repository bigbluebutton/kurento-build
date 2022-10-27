# kurento-build

Build scripts to create Kurento packages for Ubuntu 20.04 and Amazon Linux 2.  

To build the packages, change to the `kurento-build` folder and run the following commands.

> The following commands rely on `docker-compose-plugin` which is different from `docker-compose` command.  
> To install Docker Compose Plugin on Linux follow [the instructions here](https://docs.docker.com/compose/install/linux/).  
> On macOS you don't need to do anything if you are using Docker Desktop.

For Ubuntu:
```
make prepare
make build.ubuntu
make down
```

For Amazon Linux 2:
```
make prepare
make build.amzn2.deps
make build.amzn2
make down
```

And for both Ubuntu and Amazon:
```
make prepare
make build
make down
```

If you need to repeat the build process make sure that you run `make prepare` only once. This command clones Kurento repositories and checks out the version of Kurento defined in `KURENTO_VERSION` file.

You can use `make clean` command if you want to remove build artifcats and cleanup build environment.

Once everything finishes, the Kurento packages for Ubuntu 20.04 and Amazon Linux 2 will be created.


```
# ~/dev/kurento-build/packages# tree
.
├── amzn2
│   ├── noarch
│   │   ├── automake-1.15-9.amzn2.noarch.rpm
│   │   ├── kms-boost-build-1.55.0-12.amzn2.noarch.rpm
│   │   ├── kms-boost-doc-1.55.0-12.amzn2.noarch.rpm
│   │   ├── kms-boost-examples-1.55.0-12.amzn2.noarch.rpm
│   │   ├── kms-openjpeg2-devel-docs-2.1.0-7.amzn2.noarch.rpm
│   │   ├── meson-0.55.1-1.amzn2.noarch.rpm
│   │   └── websocketpp-devel-0.8.2-4.amzn2.noarch.rpm
│   ├── repodata
│   │   ├── filelists.sqlite.bz2
│   │   ├── filelists.xml.gz
│   │   ├── other.sqlite.bz2
│   │   ├── other.xml.gz
│   │   ├── primary.sqlite.bz2
│   │   ├── primary.xml.gz
│   │   └── repomd.xml
│   └── x86_64
│       ├── createrepo_c-0.17.1-1.amzn2.x86_64.rpm
│       ├── createrepo_c-devel-0.17.1-1.amzn2.x86_64.rpm
│       ├── createrepo_c-libs-0.17.1-1.amzn2.x86_64.rpm
│       ├── drpm-0.5.0-1.amzn2.x86_64.rpm
│       ├── drpm-devel-0.5.0-1.amzn2.x86_64.rpm
│       ├── faad2-2.7-9.amzn2.x86_64.rpm
│       ├── faad2-devel-2.7-9.amzn2.x86_64.rpm
│       ├── faad2-libs-2.7-9.amzn2.x86_64.rpm
│       ├── fdk-aac-0.1.5-0.1.gita0bd8aa.amzn2.x86_64.rpm
│       ├── fdk-aac-devel-0.1.5-0.1.gita0bd8aa.amzn2.x86_64.rpm
│       ├── ffmpeg-4.2.4-1.amzn2.x86_64.rpm
│       ├── ffmpeg-devel-4.2.4-1.amzn2.x86_64.rpm
│       ├── ffmpeg-libs-4.2.4-1.amzn2.x86_64.rpm
│       ├── gpac-0.7.1-8.amzn2.x86_64.rpm
│       ├── gpac-devel-0.7.1-8.amzn2.x86_64.rpm
│       ├── gpac-doc-0.7.1-8.amzn2.x86_64.rpm
│       ├── gpac-libs-0.7.1-8.amzn2.x86_64.rpm
│       ├── gpac-static-0.7.1-8.amzn2.x86_64.rpm
│       ├── kms-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-boost-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-atomic-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-chrono-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-context-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-coroutine-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-date-time-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-devel-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-filesystem-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-graph-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-iostreams-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-jam-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-locale-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-log-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-math-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-program-options-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-python-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-random-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-regex-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-serialization-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-signals-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-static-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-system-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-test-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-thread-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-timer-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-boost-wave-1.55.0-12.amzn2.x86_64.rpm
│       ├── kms-cmake-utils-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-core-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-core-devel-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-elements-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-elements-devel-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-filters-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-filters-devel-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-1.8.1-2.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-devel-1.8.1-2.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-libav-1.8.1-1.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-bad-1.8.1-5.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-bad-devel-1.8.1-5.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-base-1.8.1-2.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-base-devel-1.8.1-2.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-good-1.8.1-5.amzn2.x86_64.rpm
│       ├── kms-gstreamer1-plugins-ugly-1.8.1-1.amzn2.x86_64.rpm
│       ├── kms-jsoncpp-1.6.3-1.amzn2.x86_64.rpm
│       ├── kms-jsoncpp-devel-1.6.3-1.amzn2.x86_64.rpm
│       ├── kms-jsonrpc-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-jsonrpc-devel-6.18.0-0.amzn2.x86_64.rpm
│       ├── kms-libnice-0.1.18-0.amzn2.x86_64.rpm
│       ├── kms-libnice-devel-0.1.18-0.amzn2.x86_64.rpm
│       ├── kms-libsrtp-1.6.0-0.amzn2.x86_64.rpm
│       ├── kms-libsrtp-devel-1.6.0-0.amzn2.x86_64.rpm
│       ├── kms-libusrsctp-0.9.2-1.amzn2.x86_64.rpm
│       ├── kms-libusrsctp-devel-0.9.2-1.amzn2.x86_64.rpm
│       ├── kms-openjpeg2-2.1.0-7.amzn2.x86_64.rpm
│       ├── kms-openjpeg2-devel-2.1.0-7.amzn2.x86_64.rpm
│       ├── kms-openjpeg2-tools-2.1.0-7.amzn2.x86_64.rpm
│       ├── kms-openwebrtc-gst-plugins-0.10.0-1.amzn2.x86_64.rpm
│       ├── kms-openwebrtc-gst-plugins-devel-0.10.0-1.amzn2.x86_64.rpm
│       ├── kurento-media-server-6.18.0-0.amzn2.x86_64.rpm
│       ├── kurento-module-creator-6.18.0-0.amzn2.x86_64.rpm
│       ├── libavdevice-4.2.4-1.amzn2.x86_64.rpm
│       ├── libde265-1.0.2-6.amzn2.x86_64.rpm
│       ├── libde265-devel-1.0.2-6.amzn2.x86_64.rpm
│       ├── libde265-examples-1.0.2-6.amzn2.x86_64.rpm
│       ├── librtmp-2.4-7.20160224.gitfa8646d.amzn2.x86_64.rpm
│       ├── librtmp-devel-2.4-7.20160224.gitfa8646d.amzn2.x86_64.rpm
│       ├── libva-1.8.3-1.amzn2.x86_64.rpm
│       ├── libva-devel-1.8.3-1.amzn2.x86_64.rpm
│       ├── libvpx-1.7.0-8.amzn2.x86_64.rpm
│       ├── libvpx-devel-1.7.0-8.amzn2.x86_64.rpm
│       ├── libvpx-utils-1.7.0-8.amzn2.x86_64.rpm
│       ├── mozilla-openh264-1.5.0-4.amzn2.x86_64.rpm
│       ├── opencore-amr-0.1.3-4.amzn2.x86_64.rpm
│       ├── opencore-amr-devel-0.1.3-4.amzn2.x86_64.rpm
│       ├── openh264-1.5.0-4.amzn2.x86_64.rpm
│       ├── openh264-devel-1.5.0-4.amzn2.x86_64.rpm
│       ├── opus-1.1.3-1.amzn2.x86_64.rpm
│       ├── opus-devel-1.1.3-1.amzn2.x86_64.rpm
│       ├── python3-createrepo_c-0.17.1-1.amzn2.x86_64.rpm
│       ├── rtmpdump-2.4-7.20160224.gitfa8646d.amzn2.x86_64.rpm
│       ├── vo-aacenc-0.1.2-3.amzn2.x86_64.rpm
│       ├── vo-aacenc-devel-0.1.2-3.amzn2.x86_64.rpm
│       ├── vo-amrwbenc-0.1.3-2.amzn2.x86_64.rpm
│       ├── vo-amrwbenc-devel-0.1.3-2.amzn2.x86_64.rpm
│       ├── x264-0.148-23.20170521gitaaa9aa8.amzn2.x86_64.rpm
│       ├── x264-0.148-23.20170521gitaaa9aa8_bootstrap.amzn2.x86_64.rpm
│       ├── x264-devel-0.148-23.20170521gitaaa9aa8.amzn2.x86_64.rpm
│       ├── x264-devel-0.148-23.20170521gitaaa9aa8_bootstrap.amzn2.x86_64.rpm
│       ├── x264-libs-0.148-23.20170521gitaaa9aa8.amzn2.x86_64.rpm
│       ├── x264-libs-0.148-23.20170521gitaaa9aa8_bootstrap.amzn2.x86_64.rpm
│       ├── x265-2.9-3.amzn2.x86_64.rpm
│       ├── x265-devel-2.9-3.amzn2.x86_64.rpm
│       ├── x265-libs-2.9-3.amzn2.x86_64.rpm
│       ├── xmms-faad2-2.7-9.amzn2.x86_64.rpm
│       ├── xvidcore-1.3.4-2.amzn2.x86_64.rpm
│       └── xvidcore-devel-1.3.4-2.amzn2.x86_64.rpm
└── ubuntu
    ├── dbg
    │   ├── gstreamer1.5-libav-dbg_1.8.1-1kurento1.20.04_amd64.deb
    │   ├── gstreamer1.5-plugins-bad-dbg_1.8.1-1kurento5.20.04_amd64.deb
    │   ├── gstreamer1.5-plugins-base-dbg_1.8.1-1kurento2.20.04_amd64.deb
    │   ├── gstreamer1.5-plugins-good-dbg_1.8.1-1kurento5.20.04_amd64.deb
    │   ├── gstreamer1.5-plugins-ugly-dbg_1.8.1-1kurento1.20.04_amd64.deb
    │   ├── kms-core-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-elements-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-filters-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-jsonrpc-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kmsjsoncpp-dbg_1.6.3-1kurento1.20.04_amd64.deb
    │   ├── kurento-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kurento-media-server-dbg_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── libgstreamer1.5-0-dbg_1.8.1-1kurento2.20.04_amd64.deb
    │   ├── libsrtp0-dbg_1.6.0-0kurento1.20.04_amd64.deb
    │   └── openwebrtc-gst-plugins-dbg_0.10.0-1kurento1.20.04_amd64.deb
    ├── deps
    │   ├── libboost-filesystem1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libboost-log1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libboost-program-options1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libboost-regex1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libboost-system1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libboost-thread1.65.1_1.65.1+dfsg-0ubuntu5_amd64.deb
    │   ├── libicu60_60.2-3ubuntu3.2_amd64.deb
    │   ├── libmimic0_1.0.4-2.3_amd64.deb
    │   ├── libssl1.0.0_1.0.2n-1ubuntu5.10_amd64.deb
    │   └── libx264-152_2%3a0.152.2854+gite9a5903-2_amd64.deb
    ├── dev
    │   ├── kms-cmake-utils_6.18.0-0kurento1.20.04_all.deb
    │   ├── kms-core-dev_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-elements-dev_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-filters-dev_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kms-jsonrpc-dev_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── kmsjsoncpp-dev_1.6.3-1kurento1.20.04_amd64.deb
    │   ├── kurento-media-server-dev_6.18.0-0kurento1.20.04_amd64.deb
    │   ├── libgstreamer-plugins-bad1.5-dev_1.8.1-1kurento5.20.04_amd64.deb
    │   ├── libgstreamer-plugins-base1.5-dev_1.8.1-1kurento2.20.04_amd64.deb
    │   ├── libgstreamer1.5-dev_1.8.1-1kurento2.20.04_amd64.deb
    │   ├── libnice-dev_0.1.18-0kurento2.20.04_amd64.deb
    │   ├── libsrtp0-dev_1.6.0-0kurento1.20.04_amd64.deb
    │   ├── libusrsctp-dev_0.9.2-1kurento1.20.04_amd64.deb
    │   └── openwebrtc-gst-plugins-dev_0.10.0-1kurento1.20.04_amd64.deb
    ├── gir1.2-gst-plugins-bad-1.5_1.8.1-1kurento5.20.04_amd64.deb
    ├── gir1.2-gst-plugins-base-1.5_1.8.1-1kurento2.20.04_amd64.deb
    ├── gir1.2-gstreamer-1.5_1.8.1-1kurento2.20.04_amd64.deb
    ├── gir1.2-nice-0.1_0.1.18-0kurento2.20.04_amd64.deb
    ├── gstreamer1.0-nice_0.1.18-0kurento2.20.04_amd64.deb
    ├── gstreamer1.5-alsa_1.8.1-1kurento2.20.04_amd64.deb
    ├── gstreamer1.5-libav_1.8.1-1kurento1.20.04_amd64.deb
    ├── gstreamer1.5-nice_0.1.18-0kurento2.20.04_amd64.deb
    ├── gstreamer1.5-plugins-bad_1.8.1-1kurento5.20.04_amd64.deb
    ├── gstreamer1.5-plugins-base-apps_1.8.1-1kurento2.20.04_amd64.deb
    ├── gstreamer1.5-plugins-base_1.8.1-1kurento2.20.04_amd64.deb
    ├── gstreamer1.5-plugins-good_1.8.1-1kurento5.20.04_amd64.deb
    ├── gstreamer1.5-plugins-ugly_1.8.1-1kurento1.20.04_amd64.deb
    ├── gstreamer1.5-pulseaudio_1.8.1-1kurento5.20.04_amd64.deb
    ├── gstreamer1.5-tools_1.8.1-1kurento2.20.04_amd64.deb
    ├── gstreamer1.5-x_1.8.1-1kurento2.20.04_amd64.deb
    ├── kms-core_6.18.0-0kurento1.20.04_amd64.deb
    ├── kms-elements_6.18.0-0kurento1.20.04_amd64.deb
    ├── kms-filters_6.18.0-0kurento1.20.04_amd64.deb
    ├── kms-jsonrpc_6.18.0-0kurento1.20.04_amd64.deb
    ├── kmsjsoncpp_1.6.3-1kurento1.20.04_amd64.deb
    ├── kurento-media-server_6.18.0-0kurento1.20.04_amd64.deb
    ├── kurento-module-creator_6.18.0-0kurento1.20.04_all.deb
    ├── libgstreamer-plugins-bad1.5-0_1.8.1-1kurento5.20.04_amd64.deb
    ├── libgstreamer-plugins-base1.5-0_1.8.1-1kurento2.20.04_amd64.deb
    ├── libgstreamer1.5-0_1.8.1-1kurento2.20.04_amd64.deb
    ├── libnice10_0.1.18-0kurento2.20.04_amd64.deb
    ├── libsrtp0_1.6.0-0kurento1.20.04_amd64.deb
    ├── libusrsctp_0.9.2-1kurento1.20.04_amd64.deb
    ├── openh264-gst-plugin_1.0.0-0kurento1.20.04_amd64.deb
    ├── openh264-gst-plugins-bad-1.5_1.8.1-1kurento5.20.04_amd64.deb
    ├── openh264_1.5.0-0kurento1.20.04_amd64.deb
    ├── openwebrtc-gst-plugins_0.10.0-1kurento1.20.04_amd64.deb
    ├── srtp-docs_1.6.0-0kurento1.20.04_all.deb
    └── srtp-utils_1.6.0-0kurento1.20.04_amd64.deb
```

To install these packages on Ubuntu 20.04, you'll need to first install the packages in the dependencies `deps` folder, then in the folder above.

```
cd deps
apt-get update && apt-get install ./*.deb
cd ..
apt-get install ./*.deb
```

# kurento-build
Build scripts to create Kurento packages for Ubuntu 20.04.  

To build the packages, changed to the `kurento-build` and folder run the following commands.

```
docker-compose up -d
docker-compose exec builder prepare.sh
docker-compose exec builder build.sh
docker-compose down
```

Once everything finishes, the Kurento packages for Ubuntu 20.04 will created.


```
# ~/dev/kurento-build/packages# ls -al
total 18572
drwxr-xr-x 5  501 staff    4096 Mar  9 21:26 .
drwxr-xr-x 7  501 staff    4096 Mar  9 14:56 ..
drwxr-xr-x 2 root root     4096 Mar  9 21:26 dbg
drwxr-xr-x 2 root root     4096 Mar  9 21:26 deps
drwxr-xr-x 2 root root     4096 Mar  9 21:26 dev
-rw-r--r-- 1 root root    80432 Mar  9 21:09 gir1.2-gst-plugins-bad-1.5_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root    95868 Mar  9 20:58 gir1.2-gst-plugins-base-1.5_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root   997364 Mar  9 20:55 gir1.2-gstreamer-1.5_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root    11700 Mar  9 21:17 gir1.2-nice-0.1_0.1.18-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    15056 Mar  9 21:17 gstreamer1.0-nice_0.1.18-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    63812 Mar  9 20:58 gstreamer1.5-alsa_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root  5551688 Mar  9 21:15 gstreamer1.5-libav_1.8.1-1kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    14944 Mar  9 21:17 gstreamer1.5-nice_0.1.18-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root  1297540 Mar  9 21:09 gstreamer1.5-plugins-bad_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root    61532 Mar  9 20:58 gstreamer1.5-plugins-base-apps_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root   473916 Mar  9 20:58 gstreamer1.5-plugins-base_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root  1391072 Mar  9 21:01 gstreamer1.5-plugins-good_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root   233408 Mar  9 21:11 gstreamer1.5-plugins-ugly_1.8.1-1kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    76496 Mar  9 21:01 gstreamer1.5-pulseaudio_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root   968216 Mar  9 20:55 gstreamer1.5-tools_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root    98516 Mar  9 20:58 gstreamer1.5-x_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root   652052 Mar  9 21:21 kms-core_6.16.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root   417948 Mar  9 21:23 kms-elements_6.16.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    97988 Mar  9 21:24 kms-filters_6.16.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    25284 Mar  9 21:19 kms-jsonrpc_6.16.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    69392 Mar  9 20:51 kmsjsoncpp_1.6.3-1kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root   531188 Mar  9 21:26 kurento-media-server_6.16.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root  1701720 Mar  9 21:18 kurento-module-creator_6.16.0-0kurento1.20.04_all.deb
-rw-r--r-- 1 root root   392136 Mar  9 21:09 libgstreamer-plugins-bad1.5-0_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root   621416 Mar  9 20:58 libgstreamer-plugins-base1.5-0_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root  1783892 Mar  9 20:55 libgstreamer1.5-0_1.8.1-1kurento2.20.04_amd64.deb
-rw-r--r-- 1 root root   132872 Mar  9 21:17 libnice10_0.1.18-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    53704 Mar  9 21:05 libsrtp0_1.6.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root   208780 Mar  9 20:52 libusrsctp_0.9.2-1kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    13416 Mar  9 21:03 openh264-gst-plugin_1.0.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    59868 Mar  9 21:09 openh264-gst-plugins-bad-1.5_1.8.1-1kurento5.20.04_amd64.deb
-rw-r--r-- 1 root root   324428 Mar  9 20:50 openh264_1.5.0-0kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root    22240 Mar  9 21:16 openwebrtc-gst-plugins_0.10.0-1kurento1.20.04_amd64.deb
-rw-r--r-- 1 root root   288832 Mar  9 21:04 srtp-docs_1.6.0-0kurento1.20.04_all.deb
-rw-r--r-- 1 root root   101056 Mar  9 21:05 srtp-utils_1.6.0-0kurento1.20.04_amd64.deb
```

To install these packages on Ubuntu 20.04, you'll need to first install the packages in the dependencies `deps` folder, then in the folder above.

```
cd deps
apt-get update && apt-get install ./*.deb
cd ..
apt-get install ./*.deb
```

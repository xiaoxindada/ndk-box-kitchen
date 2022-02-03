#!/bin/bash
LOCALDIR=`cd "$( dirname ${BASH_SOURCE[0]} )" && pwd`

NDK_URL="https://dl.google.com/android/repository/android-ndk-r23b-linux.zip"
ZIP_NAME="NDK.zip"
setup_ndk() {
  wget "${NDK_URL}" -O "${ZIP_NAME}"
  7za x "${ZIP_NAME}"
  mv android-ndk-* ndk
}

build() {
  export NDK=${LOCALDIR}/ndk
  export PATH=${NDK}:${PATH}
  ndk-build
}

[ "$1" = "setup" ] && setup_ndk
cd busybox && build && cd $LOCALDIR

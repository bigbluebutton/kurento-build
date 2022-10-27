NAME=$1
KURENTO_VERSION=$(cat /KURENTO_VERSION)

mkdir -p /build

if [[ -d /build/$NAME ]]; then
  rm -rf /build/$NAME
fi

cp -R /kms/$NAME /build/
cd /build/$NAME

if [[ -f /patches/$NAME.patch ]]; then
  envsubst '$ARCH' </patches/$NAME.patch | patch -p1
fi

if [[ -f /patches/bbb-$NAME.patch ]]; then
  patch -p1 < /patches/bbb-$NAME.patch
fi

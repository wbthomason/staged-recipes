#!/usr/bin/env bash
export CFLAGS="-O3"
export CXXFLAGS="-O3"
export LIBRARY_PATH="${PREFIX}/lib"
export INCLUDE_PATH="${PREFIX}/include"
export C_INCLUDE_PATH="${PREFIX}/include"
export LDFLAGS="-L/${PREFIX}/lib"
export PKG_CONFIG="${PREFIX}/bin/pkg-config"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"
if [ "$(uname)" == "Darwin" ]; then
  # for Mac OSX
  export CC=clang
  export CXX=clang++
  export MACOSX_VERSION_MIN="10.7"
  export CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
  #export CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -std=c++11"
  export LDFLAGS="${LDFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
  #export LDFLAGS="${LDFLAGS} -stdlib=libc++ -std=c++11"
  export LINKFLAGS="${LDFLAGS}"
else
  # for linux
  export CC=
  export CXX=
fi

CC=${CC} CXX=${CXX} ./configure --prefix="${PREFIX}" \
  --with-python="${PYTHON}" \
  CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LDFLAGS="${LDFLAGS}" \
  INCLUDE_PATH="${INCLUDE_PATH}" C_INCLUDE_PATH="${C_INCLUDE_PATH}" \
  PKG_CONFIG="${PKG_CONFIG}" PKG_CONFIG_PATH="${PKG_CONFIG_PATH}" || \
  cat config.log
make
make install

#!/bin/sh

cmake ${CMAKE_ARGS} \
      -B build \
	    -DCMAKE_INSTALL_PREFIX=$PREFIX \
	    -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTING=On \
	    -G "Ninja" \
      .

cmake --build build
ninja -C build install
ninja -C build test

cmake %CMAKE_ARGS% ^
      -B build ^
      -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_TESTING=On ^
      -G "Ninja" ^
      .
if errorlevel 1 exit 1

cmake --build build
if errorlevel 1 exit 1

ninja -C build install
if errorlevel 1 exit 1

ninja -C build test
if errorlevel 1 exit 1

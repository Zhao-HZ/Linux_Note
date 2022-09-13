### usually use:
```
cmake_minimum_required(VERSION 3.0)
project (hello_cmake)
add_executable(${PROJECT_NAME} main.cpp)
```

the `project()` function will create a variable ${PROJECT_NAME} with the value hello_cmake.
```
${PROJECT_NAME} = hello_cmake
```
# Binary Directory
`CMAKE_BINARY_DIR` is the root folder for all your binary files.
CMake supports building and generating your binary files both in-place and also out-of-source.
## In-Place Build
```cmake .```
## Out-of-Source Build
```
mkdir build &&
cd build &&
cmake ..
```
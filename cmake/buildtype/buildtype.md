```
$ tree
.
├── CMakeLists.txt
├── main.cpp
```
CMake has a number of built in build configurations which can be used to compile your project. These specify the optimization levels and if debug information is to be included in the binary.
### The levels provided are:
- Release - Adds the `-O3 -DNDEBUG` flags to the compiler

- Debug - Adds the `-g` flag

- MinSizeRel - Adds `-Os -DNDEBUG`

- RelWithDebInfo - Adds `-O2 -g -DNDEBUG` flags


## Set the Build Type
```cmake
cmake .. -DCMAKE_BUILD_TYPE=Release
```
## Set Default Build Type
The default build type provided by CMake is to include no compiler flags for optimization. For some projects you may want to set a default build type so that you do not have to remember to set it.

To do this you can add the following to your top level CMakeLists.txt
```
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()
```

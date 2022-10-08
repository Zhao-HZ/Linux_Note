# Concepts

## Set Per-Target C++ Flags
The recommended way to set C++ flags in modern CMake is to use per-target flags which can be populated to other targets through the target_compile_definitions() function. This will populate the INTERFACE_COMPILE_DEFINITIONS for the library and push the definition to the linked target depending on the scope.
```cmake
target_compile_definitions(cmake_examples_compile_flags
    PRIVATE EX3
)
```
This will cause the compiler to add the definition -DEX3 when compiling the target.

If the target was a library and the scope PUBLIC or INTERFACE has been chosen the definition would also be included in any executables that link this target.

For compiler options you can also use the target_compile_options() function.
## Set Default C++ Flags
To set additional default compile flags you can add the following to your top level CMakeLists.txt
```cmake
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)
```
The flag will last even if the program is terminated.
main.cpp
```cpp
#include <iostream>

using namespace std;

int main() {
    cout << "Hello Compile Flag\n";

    #ifdef EX2
        cout << "EX2!\n"; 
    #endif
    #ifdef EX3
        cout << "EX3!\n";
    #endif
    return 0;
}
```
CMakeLists.txt
```cmake
cmake_minimum_required(VERSION 3.5)

project(demo3)

add_executable(${PROJECT_NAME} main.cpp)

target_compile_definitions(${PROJECT_NAME} PRIVATE EX3)
```
Outputs:
```
Hello Compile Flag
EX3!
```
Set CMake flag in the command line
```
cmake .. -DCMAKE_CXX_FLAGS="-DEX3"
```
Set both EX2 and EX3    
```
cmake .. -DCMAKE_CXX_FLAGS="-DEX2 -DEX3"
```

# Static Library

```
$ tree
.
├── CMakeLists.txt
├── include
│   └── static
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```
# Concepts
## 1. Adding a Static Library
The add_library() function is used to <u>create a library from some source files.</u> This is called as follows:
```cmake
add_library(hello_library STATIC
    src/Hello.cpp
)
```
## 2. Populating Including Directories
we include directories in the library using the target_include_directories() function with the scope set to PUBLIC
```cmake
target_include_directories(hello_library
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
```
Notice:
For public headers it is often a good idea to have your include folder be "namespaced" with sub-directories.
```c++
#include "static/Hello.h"
```


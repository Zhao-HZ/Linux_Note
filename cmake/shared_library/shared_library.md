# Shared Library

```
$ tree
.
├── CMakeLists.txt
├── include
│   └── shared
│       └── Hello.h
└── src
    ├── Hello.cpp
    └── main.cpp
```
## Alias Target

As the name suggests an alias target is an alternative name for a target that can be used instead of the real target name in read-only contexts.
```cmake
add_library(hello::library ALIAS hello_library)
```
This example shows how to use the variable in C/C++ source files from CMakeLists.txt

The files in this tutorial are below
```
$ tree
.
├── CMakeLists.txt
├── main.cpp
├── path.h.in
├── ver.h.in
```
# Concepts
## Configure Files
Variable substitution in a file.
This core argument for this function are source file and destination file.
```cmake
configure_file(ver.h.in ${PROJECT_BINARY_DIR}/ver.h)

configure_file(path.h.in ${PROJECT_BINARY_DIR}/path.h @ONLY)
```
The example above allows the variable to be defined like a CMake variables using the `${}` syntax or an `@@` in the `ver.h.in` file.
After generation a new file `ver.h` will be available in the `PROJECT_BINARY_DIR` 
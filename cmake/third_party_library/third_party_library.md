## A basic example of finding boost is below:
```cmake
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)
```
The arguments are:

- Boost - Name of the library. This is part of used to find the module file FindBoost.cmake

- 1.46.1 - The minimum version of boost to find

- REQUIRED - Tells the module that this is required and to fail if it cannot be found

- COMPONENTS - The list of components to find in the library.

Boost includes can take more arguments and also make use of other variables. More complex setups are provided in later examples.

## Checking if the package is found

Most included packages will set a variable `XXX_FOUND`, which can be used to check if the package is available on the system.

```cmake
if(Boost_FOUND)
    message ("boost found")
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()
```

After a package is found it will often export variables which can inform the user where to find the library, header, or executable files. Similar to the `XXX_FOUND` variable, these are package specific and are typically documented at the top of the `FindXXX.`cmake file.
## Alias / Imported targets


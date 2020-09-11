cmake_minimum_required (VERSION 3.16)

file(REMOVE_RECURSE build)
file(MAKE_DIRECTORY build)

set(CMAKE_BUILD_TYPE Debug CACHE STRING "build type")

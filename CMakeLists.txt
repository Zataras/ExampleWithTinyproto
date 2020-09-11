cmake_minimum_required(VERSION 3.1...3.15)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

project(ExampleWithTinyproto VERSION 0.0
                  DESCRIPTION "Simply CMake project using Tinyproto"
                  LANGUAGES CXX C)

set(BASE_DIR ${CMAKE_SOURCE_DIR})

file(
	GLOB_RECURSE 
	SOURCES
	src/*.*pp
	${BASE_DIR}/lib/tinyproto/tools/serial/serial_linux.c #OpenSerial() etc.
) 
 
add_executable( 
	${PROJECT_NAME}
	${SOURCES} 
)

target_include_directories(${PROJECT_NAME} PUBLIC ${BASE_DIR})

#TinyProto requires:
target_include_directories(${PROJECT_NAME} PRIVATE ${BASE_DIR}/lib/tinyproto/src)
target_link_directories( ${PROJECT_NAME} PUBLIC ${BASE_DIR}/lib/tinyproto/bld )
target_link_libraries( ${PROJECT_NAME} PUBLIC libtinyprotocol.a pthread )

target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_11)

cmake_minimum_required(VERSION 3.10)

project(sqlite3lib LANGUAGES C)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_library(sqlite3 SHARED 
    sqlite-amalgamation-3260000/sqlite3.c
)

if(MSVC)
    target_compile_definitions(sqlite3 PRIVATE "SQLITE_API=__declspec(dllexport)")

    set_target_properties(sqlite3 PROPERTIES
        OUTPUT_NAME "sqlite3"
        SUFFIX ".dll"
        PREFIX ""
    )
else()
    set_target_properties(sqlite3 PROPERTIES
        OUTPUT_NAME "sqlite3"
        PREFIX "lib"
        SUFFIX ".so"
    )
    target_link_libraries(sqlite3 PRIVATE pthread dl m)
endif()
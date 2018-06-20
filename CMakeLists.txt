cmake_minimum_required(VERSION 3.7)
project(Kern2)

set(CMAKE_C_STANDARD 99)

set(SOURCE_FILES
        kern.c
        write.c
        boot.S interrupts.c
        lib/decls.h
        lib/interrupts.h
        lib/multiboot.h
        lib/string.h
        lib/string.c)

INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/lib)

add_executable(Kern2 ${SOURCE_FILES})
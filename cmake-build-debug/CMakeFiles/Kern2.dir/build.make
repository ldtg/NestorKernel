# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/darius/Documentos/Taller2017/CLION/clion-2017.1.1/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/darius/Documentos/Taller2017/CLION/clion-2017.1.1/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/darius/CLionProjects/Kern2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/darius/CLionProjects/Kern2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Kern2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Kern2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Kern2.dir/flags.make

CMakeFiles/Kern2.dir/kern.c.o: CMakeFiles/Kern2.dir/flags.make
CMakeFiles/Kern2.dir/kern.c.o: ../kern.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Kern2.dir/kern.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Kern2.dir/kern.c.o   -c /home/darius/CLionProjects/Kern2/kern.c

CMakeFiles/Kern2.dir/kern.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Kern2.dir/kern.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/darius/CLionProjects/Kern2/kern.c > CMakeFiles/Kern2.dir/kern.c.i

CMakeFiles/Kern2.dir/kern.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Kern2.dir/kern.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/darius/CLionProjects/Kern2/kern.c -o CMakeFiles/Kern2.dir/kern.c.s

CMakeFiles/Kern2.dir/kern.c.o.requires:

.PHONY : CMakeFiles/Kern2.dir/kern.c.o.requires

CMakeFiles/Kern2.dir/kern.c.o.provides: CMakeFiles/Kern2.dir/kern.c.o.requires
	$(MAKE) -f CMakeFiles/Kern2.dir/build.make CMakeFiles/Kern2.dir/kern.c.o.provides.build
.PHONY : CMakeFiles/Kern2.dir/kern.c.o.provides

CMakeFiles/Kern2.dir/kern.c.o.provides.build: CMakeFiles/Kern2.dir/kern.c.o


CMakeFiles/Kern2.dir/write.c.o: CMakeFiles/Kern2.dir/flags.make
CMakeFiles/Kern2.dir/write.c.o: ../write.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Kern2.dir/write.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Kern2.dir/write.c.o   -c /home/darius/CLionProjects/Kern2/write.c

CMakeFiles/Kern2.dir/write.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Kern2.dir/write.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/darius/CLionProjects/Kern2/write.c > CMakeFiles/Kern2.dir/write.c.i

CMakeFiles/Kern2.dir/write.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Kern2.dir/write.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/darius/CLionProjects/Kern2/write.c -o CMakeFiles/Kern2.dir/write.c.s

CMakeFiles/Kern2.dir/write.c.o.requires:

.PHONY : CMakeFiles/Kern2.dir/write.c.o.requires

CMakeFiles/Kern2.dir/write.c.o.provides: CMakeFiles/Kern2.dir/write.c.o.requires
	$(MAKE) -f CMakeFiles/Kern2.dir/build.make CMakeFiles/Kern2.dir/write.c.o.provides.build
.PHONY : CMakeFiles/Kern2.dir/write.c.o.provides

CMakeFiles/Kern2.dir/write.c.o.provides.build: CMakeFiles/Kern2.dir/write.c.o


CMakeFiles/Kern2.dir/interrupts.c.o: CMakeFiles/Kern2.dir/flags.make
CMakeFiles/Kern2.dir/interrupts.c.o: ../interrupts.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Kern2.dir/interrupts.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Kern2.dir/interrupts.c.o   -c /home/darius/CLionProjects/Kern2/interrupts.c

CMakeFiles/Kern2.dir/interrupts.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Kern2.dir/interrupts.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/darius/CLionProjects/Kern2/interrupts.c > CMakeFiles/Kern2.dir/interrupts.c.i

CMakeFiles/Kern2.dir/interrupts.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Kern2.dir/interrupts.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/darius/CLionProjects/Kern2/interrupts.c -o CMakeFiles/Kern2.dir/interrupts.c.s

CMakeFiles/Kern2.dir/interrupts.c.o.requires:

.PHONY : CMakeFiles/Kern2.dir/interrupts.c.o.requires

CMakeFiles/Kern2.dir/interrupts.c.o.provides: CMakeFiles/Kern2.dir/interrupts.c.o.requires
	$(MAKE) -f CMakeFiles/Kern2.dir/build.make CMakeFiles/Kern2.dir/interrupts.c.o.provides.build
.PHONY : CMakeFiles/Kern2.dir/interrupts.c.o.provides

CMakeFiles/Kern2.dir/interrupts.c.o.provides.build: CMakeFiles/Kern2.dir/interrupts.c.o


CMakeFiles/Kern2.dir/lib/string.c.o: CMakeFiles/Kern2.dir/flags.make
CMakeFiles/Kern2.dir/lib/string.c.o: ../lib/string.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/Kern2.dir/lib/string.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Kern2.dir/lib/string.c.o   -c /home/darius/CLionProjects/Kern2/lib/string.c

CMakeFiles/Kern2.dir/lib/string.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Kern2.dir/lib/string.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/darius/CLionProjects/Kern2/lib/string.c > CMakeFiles/Kern2.dir/lib/string.c.i

CMakeFiles/Kern2.dir/lib/string.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Kern2.dir/lib/string.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/darius/CLionProjects/Kern2/lib/string.c -o CMakeFiles/Kern2.dir/lib/string.c.s

CMakeFiles/Kern2.dir/lib/string.c.o.requires:

.PHONY : CMakeFiles/Kern2.dir/lib/string.c.o.requires

CMakeFiles/Kern2.dir/lib/string.c.o.provides: CMakeFiles/Kern2.dir/lib/string.c.o.requires
	$(MAKE) -f CMakeFiles/Kern2.dir/build.make CMakeFiles/Kern2.dir/lib/string.c.o.provides.build
.PHONY : CMakeFiles/Kern2.dir/lib/string.c.o.provides

CMakeFiles/Kern2.dir/lib/string.c.o.provides.build: CMakeFiles/Kern2.dir/lib/string.c.o


CMakeFiles/Kern2.dir/handlers.c.o: CMakeFiles/Kern2.dir/flags.make
CMakeFiles/Kern2.dir/handlers.c.o: ../handlers.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/Kern2.dir/handlers.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Kern2.dir/handlers.c.o   -c /home/darius/CLionProjects/Kern2/handlers.c

CMakeFiles/Kern2.dir/handlers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Kern2.dir/handlers.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/darius/CLionProjects/Kern2/handlers.c > CMakeFiles/Kern2.dir/handlers.c.i

CMakeFiles/Kern2.dir/handlers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Kern2.dir/handlers.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/darius/CLionProjects/Kern2/handlers.c -o CMakeFiles/Kern2.dir/handlers.c.s

CMakeFiles/Kern2.dir/handlers.c.o.requires:

.PHONY : CMakeFiles/Kern2.dir/handlers.c.o.requires

CMakeFiles/Kern2.dir/handlers.c.o.provides: CMakeFiles/Kern2.dir/handlers.c.o.requires
	$(MAKE) -f CMakeFiles/Kern2.dir/build.make CMakeFiles/Kern2.dir/handlers.c.o.provides.build
.PHONY : CMakeFiles/Kern2.dir/handlers.c.o.provides

CMakeFiles/Kern2.dir/handlers.c.o.provides.build: CMakeFiles/Kern2.dir/handlers.c.o


# Object files for target Kern2
Kern2_OBJECTS = \
"CMakeFiles/Kern2.dir/kern.c.o" \
"CMakeFiles/Kern2.dir/write.c.o" \
"CMakeFiles/Kern2.dir/interrupts.c.o" \
"CMakeFiles/Kern2.dir/lib/string.c.o" \
"CMakeFiles/Kern2.dir/handlers.c.o"

# External object files for target Kern2
Kern2_EXTERNAL_OBJECTS =

Kern2: CMakeFiles/Kern2.dir/kern.c.o
Kern2: CMakeFiles/Kern2.dir/write.c.o
Kern2: CMakeFiles/Kern2.dir/interrupts.c.o
Kern2: CMakeFiles/Kern2.dir/lib/string.c.o
Kern2: CMakeFiles/Kern2.dir/handlers.c.o
Kern2: CMakeFiles/Kern2.dir/build.make
Kern2: CMakeFiles/Kern2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable Kern2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Kern2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Kern2.dir/build: Kern2

.PHONY : CMakeFiles/Kern2.dir/build

CMakeFiles/Kern2.dir/requires: CMakeFiles/Kern2.dir/kern.c.o.requires
CMakeFiles/Kern2.dir/requires: CMakeFiles/Kern2.dir/write.c.o.requires
CMakeFiles/Kern2.dir/requires: CMakeFiles/Kern2.dir/interrupts.c.o.requires
CMakeFiles/Kern2.dir/requires: CMakeFiles/Kern2.dir/lib/string.c.o.requires
CMakeFiles/Kern2.dir/requires: CMakeFiles/Kern2.dir/handlers.c.o.requires

.PHONY : CMakeFiles/Kern2.dir/requires

CMakeFiles/Kern2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Kern2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Kern2.dir/clean

CMakeFiles/Kern2.dir/depend:
	cd /home/darius/CLionProjects/Kern2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/darius/CLionProjects/Kern2 /home/darius/CLionProjects/Kern2 /home/darius/CLionProjects/Kern2/cmake-build-debug /home/darius/CLionProjects/Kern2/cmake-build-debug /home/darius/CLionProjects/Kern2/cmake-build-debug/CMakeFiles/Kern2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Kern2.dir/depend


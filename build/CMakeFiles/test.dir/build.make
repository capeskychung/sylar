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


# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/f/Workspace/http/sylar

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/f/Workspace/http/sylar/build

# Include any dependencies generated for this target.
include CMakeFiles/test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.dir/flags.make

CMakeFiles/test.dir/tests/test.cc.o: CMakeFiles/test.dir/flags.make
CMakeFiles/test.dir/tests/test.cc.o: ../tests/test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/f/Workspace/http/sylar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test.dir/tests/test.cc.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test.dir/tests/test.cc.o -c /mnt/f/Workspace/http/sylar/tests/test.cc

CMakeFiles/test.dir/tests/test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/tests/test.cc.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/f/Workspace/http/sylar/tests/test.cc > CMakeFiles/test.dir/tests/test.cc.i

CMakeFiles/test.dir/tests/test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/tests/test.cc.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/f/Workspace/http/sylar/tests/test.cc -o CMakeFiles/test.dir/tests/test.cc.s

CMakeFiles/test.dir/tests/test.cc.o.requires:

.PHONY : CMakeFiles/test.dir/tests/test.cc.o.requires

CMakeFiles/test.dir/tests/test.cc.o.provides: CMakeFiles/test.dir/tests/test.cc.o.requires
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/tests/test.cc.o.provides.build
.PHONY : CMakeFiles/test.dir/tests/test.cc.o.provides

CMakeFiles/test.dir/tests/test.cc.o.provides.build: CMakeFiles/test.dir/tests/test.cc.o


# Object files for target test
test_OBJECTS = \
"CMakeFiles/test.dir/tests/test.cc.o"

# External object files for target test
test_EXTERNAL_OBJECTS =

../bin/test: CMakeFiles/test.dir/tests/test.cc.o
../bin/test: CMakeFiles/test.dir/build.make
../bin/test: ../lib/libsylar.so
../bin/test: CMakeFiles/test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/f/Workspace/http/sylar/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.dir/build: ../bin/test

.PHONY : CMakeFiles/test.dir/build

CMakeFiles/test.dir/requires: CMakeFiles/test.dir/tests/test.cc.o.requires

.PHONY : CMakeFiles/test.dir/requires

CMakeFiles/test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.dir/clean

CMakeFiles/test.dir/depend:
	cd /mnt/f/Workspace/http/sylar/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/f/Workspace/http/sylar /mnt/f/Workspace/http/sylar /mnt/f/Workspace/http/sylar/build /mnt/f/Workspace/http/sylar/build /mnt/f/Workspace/http/sylar/build/CMakeFiles/test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.dir/depend


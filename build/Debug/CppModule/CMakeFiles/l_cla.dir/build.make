# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/share/cmake-3.23.2/bin/cmake

# The command to remove a file.
RM = /usr/share/cmake-3.23.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ca/LearnRepository

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ca/LearnRepository/build/Debug

# Include any dependencies generated for this target.
include CppModule/CMakeFiles/l_cla.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CppModule/CMakeFiles/l_cla.dir/compiler_depend.make

# Include the progress variables for this target.
include CppModule/CMakeFiles/l_cla.dir/progress.make

# Include the compile flags for this target's objects.
include CppModule/CMakeFiles/l_cla.dir/flags.make

CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o: CppModule/CMakeFiles/l_cla.dir/flags.make
CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o: ../../CppModule/src/class/l_cla.cpp
CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o: CppModule/CMakeFiles/l_cla.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ca/LearnRepository/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o -MF CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o.d -o CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o -c /home/ca/LearnRepository/CppModule/src/class/l_cla.cpp

CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/l_cla.dir/src/class/l_cla.cpp.i"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ca/LearnRepository/CppModule/src/class/l_cla.cpp > CMakeFiles/l_cla.dir/src/class/l_cla.cpp.i

CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/l_cla.dir/src/class/l_cla.cpp.s"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ca/LearnRepository/CppModule/src/class/l_cla.cpp -o CMakeFiles/l_cla.dir/src/class/l_cla.cpp.s

# Object files for target l_cla
l_cla_OBJECTS = \
"CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o"

# External object files for target l_cla
l_cla_EXTERNAL_OBJECTS =

../../output/Debug/CppModule/class/l_cla: CppModule/CMakeFiles/l_cla.dir/src/class/l_cla.cpp.o
../../output/Debug/CppModule/class/l_cla: CppModule/CMakeFiles/l_cla.dir/build.make
../../output/Debug/CppModule/class/l_cla: CppModule/CMakeFiles/l_cla.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ca/LearnRepository/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../output/Debug/CppModule/class/l_cla"
	cd /home/ca/LearnRepository/build/Debug/CppModule && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/l_cla.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CppModule/CMakeFiles/l_cla.dir/build: ../../output/Debug/CppModule/class/l_cla
.PHONY : CppModule/CMakeFiles/l_cla.dir/build

CppModule/CMakeFiles/l_cla.dir/clean:
	cd /home/ca/LearnRepository/build/Debug/CppModule && $(CMAKE_COMMAND) -P CMakeFiles/l_cla.dir/cmake_clean.cmake
.PHONY : CppModule/CMakeFiles/l_cla.dir/clean

CppModule/CMakeFiles/l_cla.dir/depend:
	cd /home/ca/LearnRepository/build/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ca/LearnRepository /home/ca/LearnRepository/CppModule /home/ca/LearnRepository/build/Debug /home/ca/LearnRepository/build/Debug/CppModule /home/ca/LearnRepository/build/Debug/CppModule/CMakeFiles/l_cla.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CppModule/CMakeFiles/l_cla.dir/depend

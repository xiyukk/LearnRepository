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
CMAKE_SOURCE_DIR = /home/ca/Documents/LearnRepository

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ca/Documents/LearnRepository/build/Release

# Include any dependencies generated for this target.
include CModule/CMakeFiles/timers.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CModule/CMakeFiles/timers.dir/compiler_depend.make

# Include the progress variables for this target.
include CModule/CMakeFiles/timers.dir/progress.make

# Include the compile flags for this target's objects.
include CModule/CMakeFiles/timers.dir/flags.make

CModule/CMakeFiles/timers.dir/src/time/timers.c.o: CModule/CMakeFiles/timers.dir/flags.make
CModule/CMakeFiles/timers.dir/src/time/timers.c.o: ../../CModule/src/time/timers.c
CModule/CMakeFiles/timers.dir/src/time/timers.c.o: CModule/CMakeFiles/timers.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ca/Documents/LearnRepository/build/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CModule/CMakeFiles/timers.dir/src/time/timers.c.o"
	cd /home/ca/Documents/LearnRepository/build/Release/CModule && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CModule/CMakeFiles/timers.dir/src/time/timers.c.o -MF CMakeFiles/timers.dir/src/time/timers.c.o.d -o CMakeFiles/timers.dir/src/time/timers.c.o -c /home/ca/Documents/LearnRepository/CModule/src/time/timers.c

CModule/CMakeFiles/timers.dir/src/time/timers.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/timers.dir/src/time/timers.c.i"
	cd /home/ca/Documents/LearnRepository/build/Release/CModule && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ca/Documents/LearnRepository/CModule/src/time/timers.c > CMakeFiles/timers.dir/src/time/timers.c.i

CModule/CMakeFiles/timers.dir/src/time/timers.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/timers.dir/src/time/timers.c.s"
	cd /home/ca/Documents/LearnRepository/build/Release/CModule && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ca/Documents/LearnRepository/CModule/src/time/timers.c -o CMakeFiles/timers.dir/src/time/timers.c.s

# Object files for target timers
timers_OBJECTS = \
"CMakeFiles/timers.dir/src/time/timers.c.o"

# External object files for target timers
timers_EXTERNAL_OBJECTS =

../../output/Release/CModule/bin/time/timers: CModule/CMakeFiles/timers.dir/src/time/timers.c.o
../../output/Release/CModule/bin/time/timers: CModule/CMakeFiles/timers.dir/build.make
../../output/Release/CModule/bin/time/timers: CModule/CMakeFiles/timers.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ca/Documents/LearnRepository/build/Release/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../output/Release/CModule/bin/time/timers"
	cd /home/ca/Documents/LearnRepository/build/Release/CModule && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/timers.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CModule/CMakeFiles/timers.dir/build: ../../output/Release/CModule/bin/time/timers
.PHONY : CModule/CMakeFiles/timers.dir/build

CModule/CMakeFiles/timers.dir/clean:
	cd /home/ca/Documents/LearnRepository/build/Release/CModule && $(CMAKE_COMMAND) -P CMakeFiles/timers.dir/cmake_clean.cmake
.PHONY : CModule/CMakeFiles/timers.dir/clean

CModule/CMakeFiles/timers.dir/depend:
	cd /home/ca/Documents/LearnRepository/build/Release && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ca/Documents/LearnRepository /home/ca/Documents/LearnRepository/CModule /home/ca/Documents/LearnRepository/build/Release /home/ca/Documents/LearnRepository/build/Release/CModule /home/ca/Documents/LearnRepository/build/Release/CModule/CMakeFiles/timers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CModule/CMakeFiles/timers.dir/depend


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
include CppModule/CMakeFiles/b_template.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CppModule/CMakeFiles/b_template.dir/compiler_depend.make

# Include the progress variables for this target.
include CppModule/CMakeFiles/b_template.dir/progress.make

# Include the compile flags for this target's objects.
include CppModule/CMakeFiles/b_template.dir/flags.make

CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o: CppModule/CMakeFiles/b_template.dir/flags.make
CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o: ../../CppModule/src/templates/b_template.cpp
CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o: CppModule/CMakeFiles/b_template.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ca/LearnRepository/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o -MF CMakeFiles/b_template.dir/src/templates/b_template.cpp.o.d -o CMakeFiles/b_template.dir/src/templates/b_template.cpp.o -c /home/ca/LearnRepository/CppModule/src/templates/b_template.cpp

CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/b_template.dir/src/templates/b_template.cpp.i"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ca/LearnRepository/CppModule/src/templates/b_template.cpp > CMakeFiles/b_template.dir/src/templates/b_template.cpp.i

CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/b_template.dir/src/templates/b_template.cpp.s"
	cd /home/ca/LearnRepository/build/Debug/CppModule && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ca/LearnRepository/CppModule/src/templates/b_template.cpp -o CMakeFiles/b_template.dir/src/templates/b_template.cpp.s

# Object files for target b_template
b_template_OBJECTS = \
"CMakeFiles/b_template.dir/src/templates/b_template.cpp.o"

# External object files for target b_template
b_template_EXTERNAL_OBJECTS =

../../output/Debug/CppModule/templates/b_template: CppModule/CMakeFiles/b_template.dir/src/templates/b_template.cpp.o
../../output/Debug/CppModule/templates/b_template: CppModule/CMakeFiles/b_template.dir/build.make
../../output/Debug/CppModule/templates/b_template: CppModule/CMakeFiles/b_template.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ca/LearnRepository/build/Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../output/Debug/CppModule/templates/b_template"
	cd /home/ca/LearnRepository/build/Debug/CppModule && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/b_template.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CppModule/CMakeFiles/b_template.dir/build: ../../output/Debug/CppModule/templates/b_template
.PHONY : CppModule/CMakeFiles/b_template.dir/build

CppModule/CMakeFiles/b_template.dir/clean:
	cd /home/ca/LearnRepository/build/Debug/CppModule && $(CMAKE_COMMAND) -P CMakeFiles/b_template.dir/cmake_clean.cmake
.PHONY : CppModule/CMakeFiles/b_template.dir/clean

CppModule/CMakeFiles/b_template.dir/depend:
	cd /home/ca/LearnRepository/build/Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ca/LearnRepository /home/ca/LearnRepository/CppModule /home/ca/LearnRepository/build/Debug /home/ca/LearnRepository/build/Debug/CppModule /home/ca/LearnRepository/build/Debug/CppModule/CMakeFiles/b_template.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CppModule/CMakeFiles/b_template.dir/depend


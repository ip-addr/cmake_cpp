# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.28

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\Program Files\Cmake\bin\cmake.exe"

# The command to remove a file.
RM = "D:\Program Files\Cmake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = J:\studyplace\cmake_cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = J:\studyplace\cmake_cpp\build

# Include any dependencies generated for this target.
include myUtils/module1/CMakeFiles/module1_shared.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include myUtils/module1/CMakeFiles/module1_shared.dir/compiler_depend.make

# Include the progress variables for this target.
include myUtils/module1/CMakeFiles/module1_shared.dir/progress.make

# Include the compile flags for this target's objects.
include myUtils/module1/CMakeFiles/module1_shared.dir/flags.make

myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj: myUtils/module1/CMakeFiles/module1_shared.dir/flags.make
myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj: J:/studyplace/cmake_cpp/myUtils/module1/src/module1.cpp
myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj: myUtils/module1/CMakeFiles/module1_shared.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=J:\studyplace\cmake_cpp\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj"
	cd /d J:\studyplace\cmake_cpp\build\myUtils\module1 && D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj -MF CMakeFiles\module1_shared.dir\src\module1.cpp.obj.d -o CMakeFiles\module1_shared.dir\src\module1.cpp.obj -c J:\studyplace\cmake_cpp\myUtils\module1\src\module1.cpp

myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/module1_shared.dir/src/module1.cpp.i"
	cd /d J:\studyplace\cmake_cpp\build\myUtils\module1 && D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E J:\studyplace\cmake_cpp\myUtils\module1\src\module1.cpp > CMakeFiles\module1_shared.dir\src\module1.cpp.i

myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/module1_shared.dir/src/module1.cpp.s"
	cd /d J:\studyplace\cmake_cpp\build\myUtils\module1 && D:\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S J:\studyplace\cmake_cpp\myUtils\module1\src\module1.cpp -o CMakeFiles\module1_shared.dir\src\module1.cpp.s

# Object files for target module1_shared
module1_shared_OBJECTS = \
"CMakeFiles/module1_shared.dir/src/module1.cpp.obj"

# External object files for target module1_shared
module1_shared_EXTERNAL_OBJECTS =

Debug/libmodule1_shared.dll: myUtils/module1/CMakeFiles/module1_shared.dir/src/module1.cpp.obj
Debug/libmodule1_shared.dll: myUtils/module1/CMakeFiles/module1_shared.dir/build.make
Debug/libmodule1_shared.dll: myUtils/module1/CMakeFiles/module1_shared.dir/linkLibs.rsp
Debug/libmodule1_shared.dll: myUtils/module1/CMakeFiles/module1_shared.dir/objects1.rsp
Debug/libmodule1_shared.dll: myUtils/module1/CMakeFiles/module1_shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=J:\studyplace\cmake_cpp\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ..\..\Debug\libmodule1_shared.dll"
	cd /d J:\studyplace\cmake_cpp\build\myUtils\module1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\module1_shared.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
myUtils/module1/CMakeFiles/module1_shared.dir/build: Debug/libmodule1_shared.dll
.PHONY : myUtils/module1/CMakeFiles/module1_shared.dir/build

myUtils/module1/CMakeFiles/module1_shared.dir/clean:
	cd /d J:\studyplace\cmake_cpp\build\myUtils\module1 && $(CMAKE_COMMAND) -P CMakeFiles\module1_shared.dir\cmake_clean.cmake
.PHONY : myUtils/module1/CMakeFiles/module1_shared.dir/clean

myUtils/module1/CMakeFiles/module1_shared.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" J:\studyplace\cmake_cpp J:\studyplace\cmake_cpp\myUtils\module1 J:\studyplace\cmake_cpp\build J:\studyplace\cmake_cpp\build\myUtils\module1 J:\studyplace\cmake_cpp\build\myUtils\module1\CMakeFiles\module1_shared.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : myUtils/module1/CMakeFiles/module1_shared.dir/depend


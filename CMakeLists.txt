#  	使用 首先在cmakelist.txt目录下创建一个build目录
#	然后 命令行cd ./build
#	然后 cmake -G "MinGW Makefiles" ..   
# 	生成makefile， 然后 mingw32make 
# 	这样就构建好了

#################################################
## 项目设置
cmake_minimum_required(VERSION 3.10)
set(project_name "项目名字" )
set(project_build_dir "${CMAKE_CURRENT_SOURCE_DIR}/build" )
project( "${project_name}" )    
set(target_main_bin "main" )

#################################################
## 设置 cmake转 makefile构建选项
set(CMAKE_BUILD_TYPE Debug)
add_definitions(-DDEBUG)
set(CMAKE_GENERATOR "MinGW Makefiles")
# set(CMAKE_BUILD_RPATH )
#################################################
## 设置 cpp 编译选项
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")
add_compile_options(-Wall -Wextra -pedantic   ) 

#################################################
## 指定输出的 可执行文件, lib文件, dll文件 生成的路径
# set output directories for all builds (Debug, Release, etc.)
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/static )
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/shared )
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/bin )

 

#################################################
## 添加所有源代码文件
file(GLOB SOURCE_FILES 
    "${CMAKE_CURRENT_SOURCE_DIR}/inc/*.h"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
message("源文件路径 : ${SOURCE_FILES}")

#################################################
## 设置输出的目标可执行文件
add_executable(${target_main_bin} ${SOURCE_FILES})
# 添加源文件路径
target_include_directories(${target_main_bin} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/inc)

#################################################
## 添加子模块, 第三方库函数
# 添加子（模块）路径
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/module1)
# 添加模块库依赖到target
target_link_libraries(${target_main_bin} module1_shared)

# 添加子（模块）路径
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/module2)
# 添加模块库依赖到target
target_link_libraries(${target_main_bin} module2_static)













# # 指定可执行文件的输出目录
# set_target_properties(main PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# # 输出目录配置（例如将构建结果放到build目录下）
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/arch)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/bin)




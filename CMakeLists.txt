cmake_minimum_required(VERSION 3.10)

include("${CMAKE_SOURCE_DIR}\\.cmake\\myfun.cmake") # 自己写的一些cmake函数可以放这里
#################################################
## 项目设置
project(Super_Project LANGUAGES C CXX)    
set(CMAKE_BUILD_RPATH "${CMAKE_SOURCE_DIR}/build" )
set(CMAKE_BUILD_TYPE Debug)
#################################################
## 设置 c/c++ 编译器
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_COMPILER "D:\\mingw64\\bin\\gcc.exe")
set(CMAKE_CXX_COMPILER "D:\\mingw64\\bin\\g++.exe")
add_compile_options(-Wall -Wextra -pedantic   ) 
add_definitions(-DDEBUG)
#################################################
## 设置  输出目录
set(TOTAL_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Debug/bin" )
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )
#################################################
# 添加子项目
set(module1_dir     "${CMAKE_SOURCE_DIR}/module1" )
set(module2_dir     "${CMAKE_SOURCE_DIR}/module2" )
set(practice_dir    "${CMAKE_SOURCE_DIR}/practice" )

message("=====${PROJECT_NAME} 添加子模块:${module1_dir}=====")
add_subdirectory( ${module1_dir})
message("=====${PROJECT_NAME} 添加子模块:${module2_dir}=====")
add_subdirectory( ${module2_dir})
message("=====${PROJECT_NAME} 添加子模块:${practice_dir}=====")
add_subdirectory( ${practice_dir})

set(module3_dir    "${CMAKE_SOURCE_DIR}/module3" )
message("=====${PROJECT_NAME} 添加子模块:${module3_dir}=====")
add_subdirectory( ${module3_dir})


#################################################
#  安装
set(install_dir "${CMAKE_SOURCE_DIR}/install" ) #安装目录




 

 









 




 
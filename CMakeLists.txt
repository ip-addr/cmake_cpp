if(WIN32) # windows平台操作

    cmake_minimum_required(VERSION 3.5.0)
    project(Super_Project LANGUAGES C CXX)     ## 最顶层cmakelist 掌控全局
    set(CMAKE_BUILD_RPATH "${CMAKE_SOURCE_DIR}/build" )
    set(CMAKE_BUILD_TYPE Debug)

    #################################################
    ## 设置 c/c++ 编译器
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED True)
    add_compile_options(-Wall -Wextra -pedantic   ) 
    add_definitions(-DDEBUG)
    # set(CMAKE_C_COMPILER "D:\\mingw64\\bin\\gcc.exe")
    # set(CMAKE_CXX_COMPILER "D:\\mingw64\\bin\\g++.exe")


    #################################################
    ## 设置  输出目录
    set(TOTAL_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/build/Debug" )
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${TOTAL_OUTPUT_DIRECTORY}" )

    ################################################
    ## 添加第三方库
    set(SDL2_PATH_TOP "${CMAKE_CURRENT_SOURCE_DIR}/thirdpart/SDL2-devel-2.28.2-mingw/SDL2-2.28.2/")


    #################################################
    ## 添加 自己的组件库/通用库函数?
    # 位于 myUtils文件夹下, 受子cmakelist文件控制构建
    add_subdirectory( "${CMAKE_SOURCE_DIR}/myUtils")

    #################################################
    ## 添加 子项目, 
    # 位于project文件夹下, 受子cmakelist文件控制构建
    add_subdirectory("${CMAKE_SOURCE_DIR}/project")

    #################################################
    ##  测试
    #################################################
    ##  安装
    #################################################
    ##  打包


endif()





 


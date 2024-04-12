#  	使用 首先在cmakelist.txt目录下创建一个build目录
#	然后 命令行cd ./build
#	然后 cmake -G "MinGW Makefiles" ..   
# 	生成makefile， 然后 mingw32make 
# 	这样就构建好了
# | CMAKE_SOURCE_DIR | 当前 CMakeLists.txt 所在的源码目录的根路径 |
# | CMAKE_BINARY_DIR | 构建目录的根路径，用于存放构建生成的可执行文件、库和其他输出 |
# | CMAKE_CURRENT_SOURCE_DIR | 当前处理的 CMakeLists.txt 所在的源码目录路径 |
# | CMAKE_CURRENT_BINARY_DIR | 当前处理的 CMakeLists.txt 所在的构建目录路径 |
message("路径1 CMAKE_SOURCE_DIR",${CMAKE_SOURCE_DIR})
message("路径3 CMAKE_CURRENT_SOURCE_DIR",${CMAKE_CURRENT_SOURCE_DIR})
message("路径2 CMAKE_BINARY_DIR",${CMAKE_BINARY_DIR})
message("路径4 CMAKE_CURRENT_BINARY_DIR",${CMAKE_CURRENT_BINARY_DIR})







#################################################
## 项目设置
cmake_minimum_required(VERSION 3.10)
set(project_name "项目名字" )
project( "${project_name}" )    
set(target_main_exe "main" )

set(CMAKE_BUILD_RPATH "${CMAKE_CURRENT_SOURCE_DIR}/build" )
 

#################################################
## 设置 cmake转 makefile构建选项
if(WIN32) 
    set(CMAKE_GNUtoMS ON)   
endif(WIN32) # 如果是window平台, 
# if(NOT DEFINED CMAKE_GENERATOR OR "${CMAKE_GENERATOR}" STREQUAL "")
#     message(WARNING "没有指定生成器类型")
#     # 在这里执行没有提供-G参数时的逻辑，例如：
#     set(CMAKE_GENERATOR "MinGW Makefiles")
# endif()

set(CMAKE_BUILD_TYPE Debug)
add_definitions(-DDEBUG)




#################################################
## 设置 c/c++ 编译器
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_COMPILER "gcc")
set(CMAKE_CXX_COMPILER "g++")
add_compile_options(-Wall -Wextra -pedantic   ) 

 
#################################################
## 添加所有源代码文件
file(GLOB SOURCE_FILES 
    "${CMAKE_CURRENT_SOURCE_DIR}/inc/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
message("源文件路径 : ${SOURCE_FILES}")



#################################################
## 添加可执行文件目标
add_executable(${target_main_exe} ${SOURCE_FILES}) # 添加输出的目标可执行文件
target_include_directories(${target_main_exe} PRIVATE   # 添加 头文件路径
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
)
set_target_properties(${target_main_exe}  # 设置输出文件路径
    PROPERTIES OUTPUT_NAME "main_rename" 
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Debug/" 
)





#################################################
## 添加子模块, 第三方库函数
set(MODULE_PATHS        # 定义一个变量来存储子模块路径列表
    ${CMAKE_CURRENT_SOURCE_DIR}/module1
    ${CMAKE_CURRENT_SOURCE_DIR}/module2
)
set(MODULE_LIBRARIES    # 定义一个变量来存储模块库名称列表
    "module1_shared"
    "module2_static"
)
foreach(module_path IN LISTS MODULE_PATHS) # 添加子模块路径
    add_subdirectory(${module_path})    
endforeach()
foreach(module_name IN LISTS MODULE_LIBRARIES) # 设置动态/静态库文件的构建输出路径
    set_target_properties(${module_name}    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Debug/${module_name}_arch"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Debug/${module_name}_libs" 
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Debug/${module_name}_runs"
        FOLDER "${module_name}_lib") # IDE添加分组
endforeach()

foreach(module_name IN LISTS MODULE_LIBRARIES)
    target_link_libraries(${target_main_exe}  ${module_name}) # 添加模块库依赖到target.exe
endforeach()    




 









 











# # 指定可执行文件的输出目录
# set_target_properties(main PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# # 输出目录配置（例如将构建结果放到build目录下）
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/arch)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/bin)




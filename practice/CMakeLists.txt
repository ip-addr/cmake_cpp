#  	使用 首先在cmakelist.txt目录下创建一个build目录
#	然后 命令行cd ./build
#	然后 cmake -G "MinGW Makefiles" ..   
# 	生成makefile， 然后 mingw32make 
 
project(practice_main)    
 
#################################################
## 寻找所有源代码文件
file(GLOB_RECURSE SOURCE_FILES 
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
# 寻找所有头文件路径
set(HEADER_DIRECTORIES 
    "${CMAKE_CURRENT_SOURCE_DIR}/inc"
)

message("${PROJECT_NAME} 头文件路径 : ${HEADER_DIRECTORIES}")
message("${PROJECT_NAME} 源文件列表 : ${SOURCE_FILES}")



#################################################
# 添加输出的目标可执行文件
add_executable(${PROJECT_NAME} ${SOURCE_FILES}) 

target_include_directories(${PROJECT_NAME} 
    PUBLIC    ${HEADER_DIRECTORIES} 
    PRIVATE   ${module2_dir}
    PRIVATE   ${module1_dir}
)# 头文件包含

set_target_properties(${PROJECT_NAME}  PROPERTIES  # 目标属性设置
    OUTPUT_NAME "${PROJECT_NAME}" 
    # RUNTIME_OUTPUT_DIRECTORY 
)

target_link_libraries(${PROJECT_NAME} 
    PRIVATE mylib::module2_static
    PRIVATE mylib::module1_shared
)# 库模块包含

# find_library(lib1 module1_shared PATHS ${TOTAL_OUTPUT_DIRECTORY})
# find_library(lib2 module2_static PATHS ${TOTAL_OUTPUT_DIRECTORY})
# message (" module1_shared ${lib1}")
# message (" module1_shared ${lib2}")
# target_link_libraries(${PROJECT_NAME} ${lib1} ${lib2})

# target_link_options(${PROJECT_NAME} PRIVATE "-Wl,-rpath=${TOTAL_OUTPUT_DIRECTORY}") #添加执行调试的 静态动态库路径





 









 











# # 指定可执行文件的输出目录
# set_target_properties(main PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

# # 输出目录配置（例如将构建结果放到build目录下）
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/arch)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/lib)
# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/build/bin)




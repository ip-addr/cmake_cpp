#  	使用 首先在cmakelist.txt目录下创建一个build目录
#	然后 命令行cd ./build
#	然后 cmake -G "MinGW Makefiles" ..   
# 	生成makefile， 然后 mingw32make 

project(prj_my_test)

#################################################
file(GLOB_RECURSE SOURCE_FILES ## 寻找所有源代码文件
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
)
set(HEADER_DIRECTORIES  # 寻找所有头文件路径
    "${CMAKE_CURRENT_SOURCE_DIR}/inc"
)

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
)

target_link_libraries(${PROJECT_NAME} 
    PRIVATE mylib::module2_static
    PRIVATE mylib::module1_shared
)# 库模块包含

#################################################
# # 添加 第三方库
# if(WIN32)
#     find_package(SDL2  REQUIRED CONFIG HINTS "${SDL2_PATH_TOP}") # SDL2库顶层目录

#     set(SDL2_DLL_SEARCH_PATH "${SDL2_PATH_TOP}/x86_64-w64-mingw32" ) 
#     set(SDL2_DLL_DESTINATION "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")   # SDL2库的dll 应该复制到exe同级目录

#     if(SDL2_FOUND) 
        
#         target_link_libraries(${PROJECT_NAME}  
#             PUBLIC SDL2::SDL2main
#             PUBLIC SDL2::SDL2
#         )
#         target_include_directories(${PROJECT_NAME} INTERFACE ${SDL2_INCLUDE_DIRS})

#         file(GLOB_RECURSE SDL2_DLL  "${SDL2_DLL_SEARCH_PATH}/SDL2.dll")# 搜寻可执行文件依赖的dll
#         file(MAKE_DIRECTORY "${SDL2_DLL_DESTINATION}")# 创建目标可执行文件所在的目录
#         add_custom_command( TARGET ${PROJECT_NAME} PRE_LINK # 链接前置任务,构建前生效; 当然也可以链接构建生成目标后再复制改为 POST_BUILD即可
#             COMMAND ${CMAKE_COMMAND} -E copy_if_different
#                     "${SDL2_DLL}"
#                     "${SDL2_DLL_DESTINATION}"
#             COMMENT "copy ${SDL2_DLL} to ${SDL2_DLL_DESTINATION}"
#         )

#         message("---------message---------")
#         message(" SDL2这个库包的路径SDL2_INCLUDE_DIR有: ${SDL2_INCLUDE_DIRS}")
#         message(" 找寻 SDL2_DLL在目录${SDL2_DLL_SEARCH_PATH}")
#         message(" SDL2_DLL路径为:${SDL2_DLL} ")
#         message(" SDL2这个库有这些库目标:SDL2_LIBRARY: ${SDL2_LIBRARIES}")
#         message(" 复制这个SDL2_DLL到:${SDL2_DLL_DESTINATION}, 也就是生成可执行文件的目录")
#         message("---------message end---------")

#     else()
#         message(FATAL_ERROR "没找到 SDL2这个库, Could not find SDL2.")
#     endif()
# endif(WIN32)




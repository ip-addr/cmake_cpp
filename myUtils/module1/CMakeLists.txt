project( module1_shared )

 
set(SOURCE_FILES "")
aux_source_directory( "${CMAKE_CURRENT_SOURCE_DIR}/src"  SOURCE_FILES)#源文件
set(HEADER_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/inc" )#头文件目录


message("${PROJECT_NAME} 头文件路径 : ${HEADER_DIRECTORIES}")
message("${PROJECT_NAME} 源文件列表 : ${SOURCE_FILES}")

# 定义  库目标
add_library(${PROJECT_NAME}  SHARED ${SOURCE_FILES}) # 库类型 .dll / .so 动态库
add_library(mylib::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}  INTERFACE  ${HEADER_DIRECTORIES})


# set_target_properties(${PROJECT_NAME}  PROPERTIES 
#     PREFIX "lib"
#     OUTPUT_NAME "${PROJECT_NAME}_rename"     # 设置库名称= prefix + outputname
# ) 


# macro(submodule_task) ##子cmake对变量操作,需要加上PARENT_SCOPE 才会传递给其他cmakelist!
# endmacro()
 
# 调用宏执行子模块任务
# submodule_task()


############################################################
# Install
############################################################

# # Library
# install (TARGETS ${PROJECT_NAME} 
#     DESTINATION ${CMAKE_SOURCE_DIR}/install/${PROJECT_NAME}/lib)

# # Header files
# install(DIRECTORY ${HEADER_DIRECTORIES}
#     DESTINATION ${CMAKE_SOURCE_DIR}/install/${PROJECT_NAME} )
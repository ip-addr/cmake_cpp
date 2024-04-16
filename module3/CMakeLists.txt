project( module3_static )

 
set(SOURCE_FILES "")
aux_source_directory( ${CMAKE_CURRENT_SOURCE_DIR}  SOURCE_FILES)#源文件
set(HEADER_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/include )#头文件目录

# 定义  库目标
add_library(${PROJECT_NAME}   STATIC ${SOURCE_FILES}) # 库类型 lib静态库 .a / .lib
add_library(mylib::${PROJECT_NAME}  ALIAS ${PROJECT_NAME} )

target_include_directories(${PROJECT_NAME}   INTERFACE  ${HEADER_DIRECTORIES})

set_target_properties(${PROJECT_NAME}   PROPERTIES 
    PREFIX "lib"
    OUTPUT_NAME "${PROJECT_NAME}_rename"     # 设置库名称= prefix + outputname
) 

############################################################
# Install
############################################################

# # Library
# install (TARGETS ${PROJECT_NAME} 
#     DESTINATION ${CMAKE_SOURCE_DIR}/install/${PROJECT_NAME}/lib)

# # Header files
# install(DIRECTORY ${HEADER_DIRECTORIES}
#     DESTINATION ${CMAKE_SOURCE_DIR}/install/${PROJECT_NAME} )

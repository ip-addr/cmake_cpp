# | CMAKE_SOURCE_DIR | 当前 CMakeLists.txt 所在的源码目录的根路径 |
# | CMAKE_BINARY_DIR | 构建目录的根路径，用于存放构建生成的可执行文件、库和其他输出 |

# aux_source_directory

# 定义模块1库
add_library(module1_shared SHARED module1.cpp module1.h) # 添加库类型 dll

# 设置该模块的公共头文件目录
set(module1_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
# 设置库名称
set_target_properties(module1_shared PROPERTIES 
    PREFIX "lib"
    OUTPUT_NAME "module1_shared_rename"
) 
# 将模块1的头文件目录设置为PUBLIC，以便下游目标自动继承
target_include_directories(module1_shared PUBLIC ${module1_INCLUDE_DIR})

 
 
 




# 若有内部依赖的其他源文件或库，在此处添加
# ...

# 库编译选项与依赖设置（与顶层类似）
# target_compile_options(module1_shared PRIVATE
#     -Wall                      # 启用常见编译器警告
#     -Wextra                    # 启用额外编译器警告
#     -pedantic                  # 遵循ISO C++标准
# )

# 假设使用了第三方库LibXYZ
# find_package(LibXYZ REQUIRED)
# if(TARGET LibXYZ::xyz)
#     target_link_libraries(module1_shared PRIVATE LibXYZ::xyz)
# endif()

# 子模块util/CMakeLists.txt：
# --------------------------
# add_library(util_submodule STATIC util.cpp util.h)
# 如果util模块有自己的专用头文件目录，设置并公开
# set(module1_UTIL_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
# target_include_directories(util_submodule PUBLIC ${module1_UTIL_INCLUDE_DIR})
# target_link_libraries(util_submodule PRIVATE module1_shared)
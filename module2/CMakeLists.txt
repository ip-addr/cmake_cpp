
# | CMAKE_SOURCE_DIR | 当前 CMakeLists.txt 所在的源码目录的根路径 |
# | CMAKE_BINARY_DIR | 构建目录的根路径，用于存放构建生成的可执行文件、库和其他输出 |
# aux_source_directory
set(SOURCE_FILES "")
aux_source_directory( ${CMAKE_CURRENT_SOURCE_DIR}  SOURCE_FILES)

# 定义模块2库
add_library(module2_static STATIC ${SOURCE_FILES}) # 静态库 .lib


# 设置输出文件名称
set_target_properties(module2_static PROPERTIES
    PREFIX "lib"
    OUTPUT_NAME "module2_static_rename"
)

# 设置该模块的公共头文件目录
set(module2_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
# 将模块2的头文件目录设置为PUBLIC，以便下游目标自动继承
target_include_directories(module2_static PUBLIC ${module2_INCLUDE_DIR})

 



# 若有内部依赖的其他源文件或库，在此处添加
# ...

# 库编译选项与依赖设置（与顶层类似）
# target_compile_options(module2_static PRIVATE
#     -Wall                      # 启用常见编译器警告
#     -Wextra                    # 启用额外编译器警告
#     -pedantic                  # 遵循ISO C++标准
# )

# 假设使用了第三方库LibXYZ
# find_package(LibXYZ REQUIRED)
# if(TARGET LibXYZ::xyz)
#     target_link_libraries(module2_static PRIVATE LibXYZ::xyz)
# endif()

# 子模块util/CMakeLists.txt：
# --------------------------
# add_library(util_submodule STATIC util.cpp util.h)
# 如果util模块有自己的专用头文件目录，设置并公开
# set(module2_UTIL_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
# target_include_directories(util_submodule PUBLIC ${module2_UTIL_INCLUDE_DIR})
# target_link_libraries(util_submodule PRIVATE module2_static)
# project(myUtils)

# 添加子项目
set(module1_dir     "${CMAKE_CURRENT_SOURCE_DIR}/module1" )
set(module2_dir     "${CMAKE_CURRENT_SOURCE_DIR}/module2" )

add_subdirectory( ${module1_dir})
add_subdirectory( ${module2_dir})

## ps: 嫌麻烦可以用 file直接将 文件夹下的所有modules加入到工程中,不过不够清晰明了


# 并没有学习如何 安装 myUtils自己写的包, 并且可以被find_package找到.
# 因此暂时用add_subdirectory的形式,引入自己的函数库
# 不过自己写的函数库 一般不会太大, 不进行打包安装也没太多影响.
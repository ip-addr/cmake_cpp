# cmake变量
## 变量作用域
+ 子cmake对变量操作,需要加上PARENT_SCOPE 才会传递给其他cmakelist!
+ 函数function中,需要加上RETURN_VALUE 才会传递给函数外部cmakelist!
+ ==没有RETURN_VALUE,`function`/`子cmakelist`中变量只作用于内部,或者被其他父级重名变量覆盖,不会传递给外部cmakelist!==

# cmake预设变量
CMake 中有多个预定义变量用来指示项目的不同目录结构和构建相关的路径，这里是一些常见的预定义变量及其含义：
## 预定义变量表格
| CMake 变量名 | 描述 |
| --- | --- |
| CMAKE_SOURCE_DIR | 当前 CMakeLists.txt 所在的源码目录的根路径 |
| CMAKE_BINARY_DIR | 构建目录的根路径，用于存放构建生成的可执行文件、库和其他输出 |
| CMAKE_CURRENT_SOURCE_DIR | 当前处理的 CMakeLists.txt 所在的源码目录路径 |
| CMAKE_CURRENT_BINARY_DIR | 当前处理的 CMakeLists.txt 所在的构建目录路径 |
| CMAKE_CURRENT_LIST_DIR | 当前处理的 CMakeLists.txt 文件的实际目录路径（源码或构建） |
| CMAKE_CURRENT_LIST_LINE | 当前正在处理的 CMakeLists.txt 文件中的行号 |
| CMAKE_MODULE_PATH | 用于查找额外 CMake 模块（.cmake 文件）的搜索路径列表 |
| CMAKE_INCLUDE_CURRENT_DIR | 若设为 ON，将在构建时自动将当前 CMakeLists.txt 目录添加到包含路径中 |
| CMAKE_LIBRARY_OUTPUT_DIRECTORY | 库文件的输出目录 |
| CMAKE_RUNTIME_OUTPUT_DIRECTORY | 可执行文件的输出目录 |
## 预设变量详解
1. **`CMAKE_CURRENT_SOURCE_DIR`**
   - 它指定了当前正在处理的 CMakeLists.txt 文件所在的目录。当你在多级目录结构中使用 `add_subdirectory()` 时，这个变量会随着上下文切换而变化，总是指向当前 CMakeLists.txt 文件所在的路径。

2. **`PROJECT_SOURCE_DIR`**
   - 这个变量代表了项目的顶层（根）源代码目录，即包含初始 `project()` 命令的那个 CMakeLists.txt 文件所在的目录。

3. **`CMAKE_CURRENT_BINARY_DIR`**
   - 表示当前 CMakeLists.txt 文件对应的构建目录，在构建过程中，这里的路径是指构建时产生的中间文件和目标文件的存放位置。

4. **`PROJECT_BINARY_DIR`**
   - 同样代表项目顶层的构建目录，也就是在项目根目录下执行 `cmake` 时生成的构建文件的父目录，通常相对于 `PROJECT_SOURCE_DIR`，它是一个独立的 `build` 目录。

5. **`CMAKE_BINARY_DIR`**
   - 在单个顶级 CMake 构建中，`CMAKE_BINARY_DIR` 等同于 `PROJECT_BINARY_DIR`，但在多级构建配置中，它指的是最外层或“顶级”构建目录。

6. **`CMAKE_SOURCE_DIR`**
   - 这个变量类似于 `PROJECT_SOURCE_DIR`，不过在多目录外部项目（ExternalProject）中可能有所不同，一般情况下两者相同，都指向项目根目录。

7. **`CMAKE_MODULE_PATH`**
   - 用于搜索 CMake 模块的额外路径列表。

8. **`CMAKE_CURRENT_LIST_DIR`**
   - 表示当前正在处理的 CMakeLists.txt 或 CMake 模块文件的实际物理路径。

9. **`CMAKE_CURRENT_LIST_FILE`**
   - 包含当前正在执行的 CMakeLists.txt 或 CMake 模块文件的完整路径。
## 其他预定义变量：
  
- `CMAKE_GENERATOR`
  - 当前使用的构建工具链（如 "Unix Makefiles"、"MinGW Makefiles"、"Ninja" 等）。

- `CMAKE_BUILD_TYPE`
  - 指定构建类型（如 "Debug"、"Release" 等）。

- `CMAKE_<LANG>_COMPILER`
  - 指定用于特定语言（如 C、CXX）的编译器路径。
- 等等等等.......
以上这些变量在CMake中都是全局可用的，可以帮助开发者灵活地处理不同层级的目录结构、构建选项以及系统相关的配置信息。此外，还有许多其他的预定义变量，具体可查阅CMake官方文档以获取完整列表及最新说明。

## 设置CMAKE预定义变量 `set()`
### 设置 项目构建
```cmake
if(WIN32) 
  set(CMAKE_GNUtoMS ON) 
endif(WIN32) # 如果是window平台, 
set(CMAKE_BUILD_RPATH "${CMAKE_SOURCE_DIR}/build" ) 构建目录 ./build
set(CMAKE_BUILD_TYPE Debug)  
```

---
### 设置编译选项 编译链 编译器
```cmake
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_COMPILER "gcc") 
set(CMAKE_CXX_COMPILER "g++")
```

---
## 设置 项目输出
```cmake
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY dir1)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY dir2)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY dir3)
```


# 添加编译选项

## `add_compile_options` 
```cmake
add_compile_options(-Wall -Wextra -pedantic   ) 
```

## `add_definitions(-DDEBUG -DMYDEFINE)` 添加宏定义

---




# 搜寻&添加 `源文件 .c .cpp .s`

## `aux_source_directory`
+ `aux_source_directory`:该命令可以搜索指定目录（第一个参数）下的所有源文件，将源文件的列表保存到指定的变量（第二个参数）。 
> aux_source_directory(your_directory FindSrcDir) 
## `file(GLOB/GLOB_RECURSE  )`/ 
>file(GLOB/GLOB_RECURSE  <path-to-search> <variable>)

+ `file(GLOB/GLOB_RECURSE  )`:该命令可以搜索指定目录（第一个参数）下的所有源文件，将源文件的列表保存到指定的变量（第二个参数）。
> file(GLOB FindSrcDir *.cpp)
> file(GLOB_RECURSE FindSrcDir *.cpp) #递归查找

# 添加 `头文件 .h .hpp`

## `target_include_directories`  目标局部作用
+ 可选作用域
+ 这可以确保自定义路径只应用于特定的目标，并使得相关路径不会泄漏到其他目标中。
```cmake
target_include_directories(target_name PRIVATE/PUBLIC/INTERFACE  Directory1 Directory2 ...)
```

## `include_directories`  全局作用
+ 添加头文件包含路径 全局
```cmake
include_directories(path1 path2 ...)
```

# 搜索&添加 `库文件 .a .so .dll .lib`

## `target_link_directories` 库文件
+ 这可以确保自定义路径只应用于特定的目标，并使得相关路径不会泄漏到其他目标中。
```cmake
target_link_directories(target_name PRIVATE/PUBLIC/INTERFACE  Directory1 Directory2 ...)
```

## `link_directories`  库文件
+ 添加头文件包含路径 全局
```cmake
link_directories(path1 path2 ...)
```
 

## ==需要注意的是==
1. 尽量避免在 CMake 中使用 `include_directories` 和 `link_directories` 命令来处理第三方库的头文件和链接库路径。
2. 更好的做法是使用 `find_package` 命令或编写 `Find 模块`来查找和链接第三方库，这样可以更好地管理依赖关系和跨平台兼容性。




# 创建构建目标
## `add_library`  静态/动态/组件库
```cmake
add_library(<name> [STATIC | SHARED | MODULE]
    [EXCLUDE_FROM_ALL] 
    [<source>...])
```

## `add_executable` 可执行文件
```cmake 
add_executable(<name> [WIN32] [MACOSX_BUNDLE]
    [EXCLUDE_FROM_ALL]
    [source1] [source2 ...])
```

## `add_subdirectory` :纳入子CMake构建配置
```cmake
add_subdirectory(source_dir 
    [binary_dir] 
    [EXCLUDE_FROM_ALL] 
    [SYSTEM]
)
```
+ `add_subdirectory( directory )` 用于将一个子目录及其内部的CMake构建配置纳入当前项目的构建过程。这个命令允许您组织大型项目为多个独立的子项目或模块，每个子项目都有自己的CMakeLists.txt文件，它们共同构成整个项目的构建规则。

+ `source_dir`：必填参数，指定包含子目录CMakeLists.txt文件的路径。可以是相对路径（相对于当前CMakeLists.txt文件所在目录）或绝对路径。CMake将递归地处理指定目录下的CMakeLists.txt文件，构建该子目录内的目标。

+ `binary_dir`：可选参数，指定子目录构建产物（如编译后的对象文件、库文件和可执行文件）存放的目录。如果未指定，CMake将默认在当前构建目录下创建一个与source_dir同名的子目录作为binary_dir。如果提供的是相对路径，它将相对于当前构建目录计算。

+ `EXCLUDE_FROM_ALL`：可选布尔标记，如果设置，该子目录中的目标将不会被默认构建。用户必须明确指定这些目标才能进行构建。这对于包含可选组件、测试套件或示例代码等的子目录非常有用，可以避免不必要的构建开销。

 

# 设置目标属性
## `set_target_properties`设置的属性
```cmake
set_target_properties(${module_name}    PROPERTIES
    property1 value1
    property2 value2
    .....
)
set_target_properties(my_target PROPERTIES COMPILE_DEFINITIONS MY_DEFINITION=ON)
```

## `set_property`
```cmake
set_property(
    [GLOBAL | DIRECTORY | TARGET <target-name> |
     SOURCE <source-file> | TEST <test-name> |
     INSTALL <install-target> | CACHE | ENVIRONMENT]
    PROPERTY <property-name> [value1 [value2 ...]]
)
set_property(TARGET my_target PROPERTY COMPILE_DEFINITIONS MY_DEFINITION=ON)
```
+ `set_target_properties` 语法更紧凑
+ `sett_property` 作用范围更丰富

## ==`PROPERTIES`==
+ OUTPUT_NAME 输出文件名字
+ PREFIX      输出文件前缀
+ 
---
+ ARCHIVE_OUTPUT_DIRECTORY 输出导入库路径  dll.a
+ LIBRARY_OUTPUT_DIRECTORY 输出库文件库路径 .a .lib
+ RUNTIME_OUTPUT_DIRECTORY 输出可执行文件路径 .exe .dll
+ 等等等等.......




# 导入静态/动态库文件
https://zhuanlan.zhihu.com/p/373363335
## `target_link_libraries`
```cmake
 target_link_libraries(<target>
    <PRIVATE|PUBLIC|INTERFACE> <items>...
    [<PRIVATE|PUBLIC|INTERFACE> <items>...]...
    [LINK_INTERFACE_LIBRARIES <items>...]
    [LINK_PRIVATE <items>...]
    [LINK_PUBLIC <items>...]
    [LINK_INTERFACE_MULTIPLICITY <library> <count>...]
)
```
+ 负责将库文件、其他目标（如静态库或共享库）以及链接标志与给定的目标（通常是可执行文件或库）关联起来。
+ 可以清晰地定义项目中各个组成部分之间的依赖关系，确保编译器在构建目标时能正确链接所需的库文件。

##  `target_link_options`
Add options to the link step for an executable, shared library or module
+ 添加执选项到目标可执行文件、共享库或模块的链接阶段。
library target.
```cmake
 target_link_options(<target> [BEFORE]
   <INTERFACE|PUBLIC|PRIVATE> [items1...]
   [<INTERFACE|PUBLIC|PRIVATE> [items2...] ...])
```

# cmake构建主要流程
https://zhuanlan.zhihu.com/p/371257515


# `.cmake`的使用
## `include()`
==.cmake的使用需要`include(path_to_your_.cmake_directory)`==
## 用法1.封装函数
例如
```cmake
## 查找该目录下所有头文件所在的目录,并返回头文件列表
function(find_header_directories PARENT_DIRECTORY HEADER_DIRECTORIES_OUT)
    set(HEADER_DIRECTORIES "")
    
    # 使用GLOB_RECURSE查找父目录及其子目录下的.h和.hpp文件
    file(GLOB_RECURSE HEADER_FILES
        "${PARENT_DIRECTORY}/*.h"
        "${PARENT_DIRECTORY}/*.hpp"
    )

    foreach(HEADER_FILE ${HEADER_FILES})
        # 获取包含当前头文件的目录路径
        get_filename_component(DIRECTORY_PATH ${HEADER_FILE} DIRECTORY)

        # 添加目录到HEADER_DIRECTORIES列表
        list(APPEND HEADER_DIRECTORIES ${DIRECTORY_PATH})
    endforeach()

    # 移除列表中的重复目录
    list(REMOVE_DUPLICATES HEADER_DIRECTORIES)
    set(${HEADER_DIRECTORIES_OUT} ${HEADER_DIRECTORIES} PARENT_SCOPE)
    # set(${HEADER_DIRECTORIES_OUT} ${HEADER_DIRECTORIES}  )
    # 将结果赋值给OUT_HEAR_DIRS参数，供父级CMake脚本使用 
    # 必要的,不然这些变量只作用于函数内部,或者被其他重名变量覆盖
endfunction()
```
## 用法2.封装变量

## 用法3.封装宏

## 用法4.封装脚本模块







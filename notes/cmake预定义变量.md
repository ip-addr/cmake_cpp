CMake 中有多个预定义变量用来指示项目的不同目录结构和构建相关的路径，这里是一些常见的预定义变量及其含义：

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

其他重要的预定义变量还包括：

- `CMAKE_INSTALL_PREFIX`
  - 默认的安装目录。
  
- `CMAKE_GENERATOR`
  - 当前使用的构建工具链（如 "Unix Makefiles"、"MinGW Makefiles"、"Ninja" 等）。

- `CMAKE_BUILD_TYPE`
  - 指定构建类型（如 "Debug"、"Release" 等）。

- `CMAKE_<LANG>_COMPILER`
  - 指定用于特定语言（如 C、CXX）的编译器路径。

- `CMAKE_SYSTEM_NAME`, `CMAKE_SYSTEM_VERSION`, `CMAKE_SYSTEM_PROCESSOR`
  - 描述目标系统的名称、版本和处理器架构。

以上这些变量在CMake中都是全局可用的，可以帮助开发者灵活地处理不同层级的目录结构、构建选项以及系统相关的配置信息。此外，还有许多其他的预定义变量，具体可查阅CMake官方文档以获取完整列表及最新说明。


## 
在您提供的 CMake 配置代码中，有三个 set 命令分别设置了不同的输出目录变量。这些变量定义了项目构建过程中不同类型的目标文件（如可执行文件、库文件、动态链接库文件）的默认输出位置。以下是这三个生成项的具体含义：

1. `CMAKE_ARCHIVE_OUTPUT_DIRECTORY`
此变量指定了静态库（archive files）的输出路径。当项目中包含 add_library 命令并指定 STATIC 构建类型时，生成的 .a 文件（在 Unix-like 系统上）或 .lib 文件（在 Windows 上）将会被放置到这个指定的目录中。例如，在您提供的代码中：

cmake
set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/lib )
这意味着所有静态库文件将在 ${CMAKE_CURRENT_SOURCE_DIR}/Debug/lib 目录下生成。

2. `CMAKE_LIBRARY_OUTPUT_DIRECTORY`
这个变量适用于非可执行目标（non-executable targets），主要指动态库（shared libraries）。当使用 add_library 命令创建一个 SHARED 类型的库时，生成的 .so 文件（Linux）、.dylib 文件（macOS）或 .dll 文件（Windows）会被放置到指定的目录。在您的代码中：

cmake
set( CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/lib )
动态库文件将被放在 ${CMAKE_CURRENT_SOURCE_DIR}/Debug/lib 目录下。

3. `CMAKE_RUNTIME_OUTPUT_DIRECTORY`
此变量决定了可执行文件（executable targets）的输出路径。当您使用 add_executable 命令创建一个可执行程序时，生成的可执行文件（如 .exe 文件在 Windows 上，或无特定后缀的可执行文件在 Unix-like 系统上）会按照这个变量指定的目录进行存放。在您给出的配置中：

cmake
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/Debug/bin )
所有的可执行文件将被放置到 ${CMAKE_CURRENT_SOURCE_DIR}/Debug/bin 目录下。

综上所述，这三个变量分别控制了项目构建过程中静态库、动态库以及可执行文件的默认输出位置。通过设置这些变量，您可以统一管理不同类型的输出文件，使得项目结构更加清晰，并方便后续的部署和调试。需要注意的是，这里的路径都是相对于 CMAKE_CURRENT_SOURCE_DIR 的，即项目的源代码根目录。同时，所有路径都指定了 Debug 子目录，表明这些配置适用于 Debug 构建配置。如果您还希望对 Release 等其他构建配置指定不同的输出目录，可以使用带有 <CONFIG> 后缀的对应变量（如 CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG、CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG 和 CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG），或者使用条件语句来区分不同配置下的输出路径。
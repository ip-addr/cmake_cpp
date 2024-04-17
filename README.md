+ 这个简单的项目,学习参考的:[cmake-examples](https://github.com/ttroy50/cmake-examples/tree/master)这个项目教程.
 

# 使用cmake+MinGW构建c项目

## 将项目跑起来
+ vscode安装必要的debug插件,并安装好MinGW,并安装好cmake
+ 按下`F5`即可
+ 可选择安装vsocde的cmake tools插件,可视化操作


## 工具链说明:
+ 编译链接器：MinGW   x86_64-w64-mingw32
+ 构建工具:   cmake >3.5.0
+ 构建平台:   windows10/11 x86_x64
+ 辅助工具:   vscode, cmake-tools

## 项目目录结构:
```cmake
|-- CMakeLists.txt
|-- README.html
|-- README.md
|-- build
|   |-- CMakeCache.txt
|   |-- CMakeFiles
|   |-- Debug
|   |-- Makefile
|   |-- cmake_install.cmake
|   |-- compile_commands.json
|   |-- myUtils
|   `-- project
|-- myUtils
|   |-- CMakeLists.txt
|   |-- module1
|   |-- module2
|   `-- module3
|-- project
|   |-- CMakeLists.txt
|   |-- prj_SDL2
|   `-- prj_my_test
`-- thirdpart
    `-- SDL2-devel-2.28.2-mingw
```
## 项目意图
+ project 
    + 所有子项目均放置在此
    + pri_my_test 日常写一些刷题代码项目
    + prj_SDL2    导入第三方库测试项目
+ thirdParty
    + 所有第三方库均放置在此
    + SDL2-devel-2.28.2-mingw
+ myUtils
    + 所有可复用的模块均放置在此
    + module1
    + module2
+ .cmake
  + 存放一些自己写的,可复用的cmake函数, 暂没用
  + myfunc.cmake 
+ build
  + 所有构建生成的文件,cmake的构建目录

+ 项目的构建全部依靠CMakeLists.txt管理
+ 采用树状目录 管理cmake构建流程,理清构建流程

## 共两个子项目
1. pri_my_test
> pri_my_test 依赖包含
> >module1 动态库模块
> >module2 静态库模块

2. pri_SDL2 
> pri_SDL2 依赖包含
> > SDL2 第三方库


## 值得注意的是:
1. 这里统一将 构建生成的,项目依赖的`共享库/动态库dll`以及`可执行文件exe`,或复制,或生成在 `/build/Debug/`目录下.
2. 这个项目 只涉及到 `find_package`导入其他库, 不涉及到如何打包自己的库并安装.(待学习)
3. `.so/.dll` 动态库, 又名`共享库`,体积小,运行时共享一块内存,故而速度更快. --但缺点是,如果程序运行时,需要用到的库没有加载,就会报错,且无法动态加载.==因此,必须将`动态库`添加到环境变量,或是复制到`可执行文件同级目录`下, `相应的exe`才能运行.==
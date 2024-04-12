共有两种库：
一种是 LIB 包含了函数所在的 DLL 文件和文件中函数位置的信息（入口），代码由运行时加载在进程空间中的 DLL 提供，称为动态链接库 dynamic link library。
一种是 LIB 包含函数代码本身，在编译时直接将代码加入程序当中，称为静态链接库 static link library。
共有两种链接方式：
动态链接使用动态链接库，允许可执行模块（.dll 文件或.exe 文件）仅包含在运行时定位 DLL 函数的可执行代码所需的信息。
静态链接使用静态链接库，链接器从静态链接库 LIB 获取所有被引用函数，并将库同代码一起放到可执行文件中。

关于 lib 和 dll 的区别如下：
（1）lib 是编译时用到的，dll 是运行时用到的。如果要完成源代码的编译，只需要 lib；如果要使动态链接的程序运行起来，只需要 dll。
（2）如果有 dll 文件，那么 lib 一般是一些索引信息，记录了 dll 中函数的入口和位置，dll 中是函数的具体内容；如果只有 lib 文件，那么这个 lib 文件是静态编译出来的，索引和实现都在其中。使用静态编译的 lib 文件，在运行程序时不需要再挂动态库，缺点是导致应用程序比较大，而且失去了动态库的灵活性，发布新版本时要发布新的应用程序才行。
（3）动态链接的情况下，有两个文件：一个是 LIB 文件，一个是 DLL 文件。LIB 包含被 DLL 导出的函数名称和位置，DLL 包含实际的函数和数据，应用程序使用 LIB 文件链接到 DLL 文件。在应用程序的可执行文件中，存放的不是被调用的函数代码，而是 DLL 中相应函数代码的地址，从而节省了内存资源。DLL 和 LIB 文件必须随应用程序一起发行，否则应用程序会产生错误。如果不想用 lib 文件或者没有 lib 文件，可以用 WIN32 API 函数 LoadLibrary、GetProcAddress 装载。

使用 lib 需注意两个文件：
（1）.h 头文件，包含 lib 中说明输出的类或符号原型或数据结构。应用程序调用 lib 时，需要将该文件包含入应用程序的源文件中。
（2）.LIB 文件，略。

使用 dll 需注意三个文件：
（1）.h 头文件，包含 dll 中说明输出的类或符号原型或数据结构的.h 文件。应用程序调用 dll 时，需要将该文件包含入应用程序的源文件中。
（2）.LIB 文件，是 dll 在编译、链接成功之后生成的文件，作用是当其他应用程序调用 dll 时，需要将该文件引入应用程序，否则产生错误。如果不想用 lib 文件或者没有 lib 文件，可以用 WIN32 API 函数 LoadLibrary、GetProcAddress 装载。
（3）.dll 文件，真正的可执行文件，开发成功后的应用程序在发布时，只需要有.exe 文件和.dll 文件，并不需要.lib 文件和.h 头文件。

使用 lib 的方法：
静态 lib 中，一个 lib 文件实际上是任意个 obj 文件的集合，obj 文件是 cpp 文件编译生成的。在编译这种静态库工程时，根本不会遇到链接错误；即使有错，也只会在使用这个 lib 的 EXT 文件或者 DLL 工程里暴露出来。
在 VC 中新建一个 static library 类型的工程 Lib，加入 test.cpp 文件和 test.h 文件（头文件内包括函数声明），然后编译，就生成了 Lib.lib 文件。
别的工程要使用这个 lib 有两种方式：
（1）在 project->link->Object/Library Module 中加入 Lib.lib 文件（先查询工程目录，再查询系统 Lib 目录）；或者在源代码中加入指令 #pragma comment (lib, “Lib.lib”)。
（2）将 Lib.lib 拷入工程所在目录，或者执行文件生成的目录，或者系统 Lib 目录中。
（3）加入相应的头文件 test.h。

使用 DLL 的方法：
使用动态链接中的 lib，不是 obj 文件的集合，即里面不会有实际的实现，它只是提供动态链接到 DLL 所需要的信息，这种 lib 可以在编译一个 DLL 工程时由编译器生成。
创建 DLL 工程的方法（略）。
（1）隐式链接
第一种方法是：通过 project->link->Object/Library Module 中加入.lib 文件（或者在源代码中加入指令 #pragma comment (lib, “Lib.lib”)），并将.dll 文件置入工程所在目录，然后添加对应的.h 头文件。


```c
#include "stdafx.h"
#include "DLLSample.h"

#pragma comment(lib, "DLLSample.lib")    // 你也可以在项目属性中设置库的链接

 int main()
{
        TestDLL(123);   //dll 中的函数，在 DllSample.h 中声明
        return(1);
}
```
（2）显式链接
需要函数指针和 WIN32 API 函数 LoadLibrary、GetProcAddress 装载，使用这种载入方法，不需要.lib 文件和.h 头文件，只需要.dll 文件即可（将.dll 文件置入工程目录中）。


```c
#include <iostream>
#include <windows.h>         // 使用函数和某些特殊变量
 typedef void (*DLLFunc)(int);
int main()
{
        DLLFunc dllFunc;
        HINSTANCE hInstLibrary = LoadLibrary("DLLSample.dll");

        if (hInstLibrary == NULL)
        {
          FreeLibrary(hInstLibrary);
        }
        dllFunc = (DLLFunc)GetProcAddress(hInstLibrary, "TestDLL");
        if (dllFunc == NULL)
        {
          FreeLibrary(hInstLibrary);
        }
        dllFunc(123);
        std::cin.get();
        FreeLibrary(hInstLibrary);
        return(1);
}
``` 

LoadLibrary 函数利用一个名称作为参数，获得 DLL 的实例（HINSTANCE 类型是实例的句柄），通常调用该函数后需要查看一下函数返回是否成功，如果不成功则返回 NULL（句柄无效），此时调用函数 FreeLibrary 释放 DLL 获得的内存。
GetProcAddress 函数利用 DLL 的句柄和函数的名称作为参数，返回相应的函数指针，同时必须使用强转；判断函数指针是否为 NULL，如果是则调用函数 FreeLibrary 释放 DLL 获得的内存。此后，可以使用函数指针来调用实际的函数。
最后要记得使用 FreeLibrary 函数释放内存。

注意：应用程序如何找到 DLL 文件？
使用 LoadLibrary 显式链接，那么在函数的参数中可以指定 DLL 文件的完整路径；如果不指定路径，或者进行隐式链接，Windows 将遵循下面的搜索顺序来定位 DLL：
（1）包含 EXE 文件的目录
（2）工程目录
（3）Windows 系统目录
（4）Windows 目录
（5）列在 Path 环境变量中的一系列目录


 
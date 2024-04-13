
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
 

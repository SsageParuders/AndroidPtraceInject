
##################### ⬇输出文件重定向⬇ #####################
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY   
    /${CMAKE_SOURCE_DIR}/outputs/${CMAKE_ANDROID_ARCH_ABI}/
) # 重定向输出产物(动态库)
##################### ⬆输出文件重定向⬆ #####################


##################### ⬇CMake头文件设置⬇ #####################
FILE(GLOB_RECURSE FILE_INCLUDES # 遍历子目录下所有符合情况的头文件
    ${CMAKE_CURRENT_SOURCE_DIR}/*.h*
)
include_directories( # 设置全局头文件目录 使其他源码文件可在任意目录<头文件.h>
    ${CMAKE_CURRENT_SOURCE_DIR}/include/
)
##################### ⬆CMake头文件设置⬆ #####################


##################### ⬇CMake源文件设置⬇ #####################
FILE(GLOB_RECURSE FILE_SOURCES # 遍历子目录下所有符合情况的源文件
    ${CMAKE_CURRENT_SOURCE_DIR}/*.c*
)
##################### ⬆CMake源文件设置⬆ #####################


##################### ⬇添加产物⬇ #####################
add_library(Hook SHARED # 生成动态库
    ${FILE_INCLUDES} # 头文件
    ${FILE_SOURCES} # 源文件
)
##################### ⬆添加产物 ⬆ #####################

##################### ⬇连接库文件⬇ #####################
target_link_libraries(Hook PRIVATE 
    log
)
##################### ⬆连接库文件⬆ #####################
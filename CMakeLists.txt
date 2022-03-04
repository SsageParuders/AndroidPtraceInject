cmake_minimum_required(VERSION 3.2.2) # 最低CMake版本要求

##################### ⬇Android设置⬇ #####################
set(CMAKE_SYSTEM_NAME ANDROID) # 设置目标编译平台参数 Android
set(CMAKE_SYSTEM_VERSION 28) # 系统版本
set(ANDROID_PLATFORM 28) # 平台版本
set(ANDROID_ABI arm64-v8a) # 设置目标构架 armeabi-v7a arm64-v8a x86
##
## 由于ANDROID_ABI一次编译只能设置一种架构
## 因此该参数在build.sh脚本中单独设置 并且每种架构编译一次
##
set(ANDROID_NDK /Users/hongqing/Library/Android/sdk/ndk/ollvm) # 设置ndk路径
set(CMAKE_TOOLCHAIN_FILE /Users/hongqing/Library/Android/sdk/ndk/ollvm/build/cmake/android.toolchain.cmake) # 设置交叉编译链的cmake配置
##################### ⬆Android设置⬆ #####################

project(NativeSurface VERSION 0.1.0) # 工程名称 + 版本

##################### ⬇项目相关参数设置⬇ #####################
set(CMAKE_CXX_STANDARD 17) # c++ 标准
set(CMAKE_CXX_FLAGS "-fno-rtti -fno-exceptions -DNDEBUG -fvisibility=hidden -Wno-narrowing -fdeclspec -pthread -w -s -fexceptions -Wall -O3"
) # 参数
##################### ⬆项目相关参数设置⬆ #####################

##################### ⬇子模块设置⬇ #####################
add_subdirectory(Inject)
add_subdirectory(Hook)
##################### ⬆子模块设置⬆ #####################
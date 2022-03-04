
## 目标架构数组
abi_array=(armeabi-v7a arm64-v8a x86)

## 进入build目录
cd build

if [ $? -ne 0 ]; then
    echo "\033[41;37mFAILED to cd build !!\033[0m\n"
else
    echo "\033[42;35mSUCCEED to cd build !!\033[0m\n"
fi

## 遍历架构数组 编译目标架构产物
for (( i=0; i < ${#abi_array[@]}; i++)) do

    ## 清空cmake中间文件
    rm -rf *

    if [ $? -ne 0 ]; then
        echo "\033[41;37mFAILED to clean !!\033[0m\n"
    else
        echo "\033[42;35mSUCCEED to clean !!\033[0m\n"
    fi

    echo "\n\033[44;37mStart to build ABI of "${abi_array[i]}"\033[0m";

    ## 生存编译配置文件
    cmake .. \
    -DANDROID_ABI=${abi_array[i]} \
    -G Ninja

    if [ $? -ne 0 ]; then
        echo "\033[41;37mFAILED to Configuring and Generating Build files !!\033[0m\n"
    else
        echo "\033[42;35mSUCCEED to Configuring and Generating Build files !!\033[0m\n"
    fi

    ## 编译
    cmake --build .

    if [ $? -ne 0 ]; then
        echo "\033[41;37mFAILED to build !!\033[0m\n"
    else
        echo "\033[42;35mSUCCEED to build !!\033[0m\n"
    fi

    ## 清空cmake中间文件
    rm -rf *

    if [ $? -ne 0 ]; then
        echo "\033[41;37mFAILED to clean !!\033[0m\n"
    else
        echo "\033[42;35mSUCCEED to clean !!\033[0m\n"
    fi

done;

## 离开build目录
cd ..

if [ $? -ne 0 ]; then
    echo "\033[41;37mFAILED to exit build !!\033[0m\n"
else
    echo "\033[42;35mSUCCEED to exit build !!\033[0m\n"
fi
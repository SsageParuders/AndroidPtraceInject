# Android Ptrace Inject

## How to build

- Make sure you have `CMake` and `Ninja` in your PATH

- Edit CMakeLists.txt. Set `ANDROID_NDK` and `CMAKE_TOOLCHAIN_FILE` for yourself.

- If your OS is Windows, read `build.sh` and make it to be a `build.bat`.

  Don't forget to change `CMAKE_RUNTIME_OUTPUT_DIRECTORY` and `CMAKE_LIBRARY_OUTPUT_DIRECTORY` in Windows styles.

```shell
git clone https://github.com/SsageParuders/AndroidPtraceInject.git
cd AndroidPtraceInject
mkdir build
chmod +x build.sh
./build.sh
```

## How to use

```shell
# Here are the parameters of the Inject command line tool:
#   Some parameters are optional.
#   -p 目标进程pid <-- 不传pid就传包名
#   -n 目标App包名 <-- 不传包名就传pid
#   -f 是否开启App <-- 看你要不要强制唤醒App
#   ---- // 由于 -f 参数需要创建中间文件 因此 请务必在Inject工具目录执行该工具
#   ---- // 即 /data/local/tmp/Inject -f -n XXX <-- 错误
#   ---- // 即 cd /data/local/tmp && ./Inject -f -n XXX <-- 正确
#   -so 注入的so路径 <-- 必填 本来就是so注入工具
#   -symbols 指定启用so中的某功能 <-- 选填 可以指定so中某功能的symbols 也可以通过__attribute__((constructor))让so注入后自行初始化
cd /data/local/tmp && ./Inject -f -n bin.mt.plus -so /data/local/tmp/libHook.so -symbols hello
```

# TODO LIST

## Finished

- [x] First Inject

- [x] handle_parameter

- [x] handle_selinux

## Future

- [ ] Adapt to all Android versions

- [ ] Adapt to the ABIs of each device

# Credits

[SharkInject](https://github.com/bigGreenPeople/SharkInject) By bigGreenPeople

[androidinject](https://github.com/mergerly/androidinject) By mergerly


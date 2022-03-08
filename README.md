# Android Ptrace Inject

> 中文可以参考我的注释内容进行理解 <br>
> 我写的注释相对来说比较全面了

## How to build

- Make sure you have `CMake` and `Ninja` in your PATH

- Edit CMakeLists.txt. Set [`ANDROID_NDK`](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/CMakeLists.txt#L12) and [`CMAKE_TOOLCHAIN_FILE`](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/CMakeLists.txt#L13) for yourself.

- If your OS is Windows, read `build.sh` and make it to be a `build.bat`.

  Also, don't forget to change [`CMAKE_RUNTIME_OUTPUT_DIRECTORY`](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/Inject/CMakeLists.txt#L4) and [`CMAKE_LIBRARY_OUTPUT_DIRECTORY`](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/Hook/CMakeLists.txt#L4) in Windows styles.

- If you want to build all ABIs, u can annotation [ANDROID_ABI on CMakeLists.txt](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/CMakeLists.txt#L7), and run build.sh
  ```shell
  git clone https://github.com/SsageParuders/AndroidPtraceInject.git
  cd AndroidPtraceInject
  mkdir build
  chmod +x build.sh
  ./build.sh
  ```
- Or you can don't run build.sh and don't annotation [ANDROID_ABI on CMakeLists.txt](https://github.com/SsageParuders/AndroidPtraceInject/blob/dfcee37e0c302d70e81c323c326e21c7f9bfa08e/CMakeLists.txt#L7).
  ```shell
  git clone https://github.com/SsageParuders/AndroidPtraceInject.git
  cd AndroidPtraceInject
  mkdir build
  cd build
  cmake .. -G Ninja
  cmake --build .
  ```

## How to use

```shell
# Here are the parameters of the Inject command line tool:
#   Some parameters are optional.
#   -p process 's pid <-- optional
#   -n process 's package name <-- optional
#   -f whether to start App <-- optional
#   ---- //  /data/local/tmp/Inject -f -n XXX <-- error
#   ---- //  cd /data/local/tmp && ./Inject -f -n XXX <-- right
#   -so so path for injection <-- mandatory
#   -symbols specify a symbol in so <-- optional
# For examples:
cd /data/local/tmp && ./Inject -f -n bin.mt.plus -so /data/local/tmp/libHook.so -symbols hello
```

# TODO LIST

## Finished

- [x] First Inject Succeeded

- [x] Handle Parameter

- [x] Handle SELinux

- [x] Handle Libs

- [x] Succeed Inject for armeabi-v7a and arm64-v8a

- [x] Succeed Inject for Android 9 and Android 11

## Future

- [ ] Adapt to all Android versions

- [ ] Adapt to the ABIs of each device, such as x86 and x86_64

# Credits

[SharkInject](https://github.com/bigGreenPeople/SharkInject) By bigGreenPeople

[androidinject](https://github.com/mergerly/androidinject) By mergerly


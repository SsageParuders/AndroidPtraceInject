# Android Ptrace Inject

## How to build

```shell
git clone XXXXXXX
cd XXXX
chmod +x build.sh
./build.sh
```

## How to use

```shell
#以下是Inject命令行工具的参数:
#   部分参数选填
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

- [x] handle_parameter

- [x] First Inject

## Future

- [ ] Adapt to all Android versions

- [ ] Adapt to the ABIs of each device

# Credits

[SharkInject](https://github.com/bigGreenPeople/SharkInject) By bigGreenPeople

[androidinject](https://github.com/mergerly/androidinject) By mergerly





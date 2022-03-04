// system lib
#include <unistd.h>

// user lib
#include <Logger.h>

extern "C"{
// 如果功能需要被dlsym调用出来，那么传入的应该是函数的symbpls
// 因此 如果编译选项开启了-fvisibility=hidden
// 那么就需要用__attribute__((visibility ("default")))修饰被调用的功能 以确保功能可以被外部调用
// 同时用extern "C"保证以c风格编译(c风格编译，symbols是函数名本身)
// 而不是c++风格编译(c++风格编译后，symbaps为__ZXXX_XX格式)
// 或者自行ida查看symbols
__attribute__((visibility ("default"))) void hello(){
    LOGD("This fun comed from libHook.so::hello ~~");
}
}

// 先atmain函数执行的 最高执行权重函数
__unused __attribute__((constructor)) void constructor_main(){
    LOGD("Inject Ok");

    int pid = getpid();

    LOGD("Hello I'am from libHook.so ~~ from pid:%d", pid);

    LOGD("Inject Finished");
}

// 主函数
int main(){ // nothing to do
    return 0;
}
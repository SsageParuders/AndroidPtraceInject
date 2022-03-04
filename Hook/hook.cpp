// system lib
#include <iostream>
#include <unistd.h>

// user lib
#include <Logger.h>

void hello(){
    LOGD("This fun comed from libHook.so::hello ~~");
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
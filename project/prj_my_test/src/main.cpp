//////////////////////// demo1

#include "main.h"
void Module_Test(){
    
    fun1();
    fun2();
    
    module1_fun();
    module2_fun();
}

int main(int argc, char *argv[]) 
{
    argc =argc; argv=argv;

    Module_Test();
    
    return 0;
}


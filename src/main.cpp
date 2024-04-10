//////////////////////// demo1
 #include <iostream>
 #include "module1.h"
 #include "fun1.h"
 #include "fun2.h"





int main()
{
    int a =1;
    module1_fun();

    scanf("%d",&a);
    std::cout << "input a value is: " << a << std::endl;
    std::cout << "Hello, main====runing" << std::endl;

        fun1();
        fun2();
}

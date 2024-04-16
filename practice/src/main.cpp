//////////////////////// demo1

 #include "main.h"
 #include <SDL.h>
 #include <SDL_log.h>


void SDL_Test();
void Module_Test();
/*
如果使用了SDL.h，则打印输出需要使用SDL_Log

因为SDL_main.h 中定义了宏 SDL_MAIN_NEEDED的话
    #if defined(SDL_MAIN_NEEDED) || defined(SDL_MAIN_AVAILABLE)
    #define main    SDL_main
    #endif
就会
    extern SDLMAIN_DECLSPEC int SDL_main(int argc, char *argv[]);
*/ 

int main(int argc, char *argv[]) //如果包含了SDL2,入口主函数需要有这些参数.因为SDL2需要这些参数.
{
    argc=argc; argv=argv;//避免未使用的参数 warning, 可注释掉
    if(SDL_Init(SDL_INIT_VIDEO)<0){
        SDL_Log("SDL无法初始化,错误:%s\n",SDL_GetError());
    }else
    {
        SDL_Log("SDL初始化成功:%sSDL加载成功\n",SDL_GetError());
        SDL_Test();
    }
    return 0;
}


void SDL_Test()
{
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("YourGame", 
    									  SDL_WINDOWPOS_UNDEFINED, 
    									  SDL_WINDOWPOS_UNDEFINED, 
    									  700, 600, 
    									  SDL_WINDOW_SHOWN);
    SDL_Surface *surface = SDL_GetWindowSurface(window);
    SDL_Surface* blackground_surface = SDL_LoadBMP("Hello.bmp");
    SDL_BlitSurface(blackground_surface, NULL, surface, NULL);
    SDL_UpdateWindowSurface(window);
    SDL_Delay(2000);//显示两秒窗口
    SDL_DestroyWindow(window);
    SDL_Quit();
}

void Module_Test(){
    
    fun1();
    fun2();
    
    module1_fun();
    module2_fun();
}
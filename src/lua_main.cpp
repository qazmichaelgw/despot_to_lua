#include <iostream>
#include <time.h>
#include <stdio.h>

#include "lua.hpp"
#include "lualib.h"
#include "lauxlib.h"

extern "C"
{
 int luaopen_lua_pocman(lua_State* L); // declare the wrapped module
}

#define LUA_EXTRALIBS {"lua_pocman",luaopen_lua_pocman},

int main(int argc, const char * argv[])
{
 lua_State *L;
 if (argc<2)
 {
     printf("%s: <filename.lua>\n",argv[0]);
     return 0;
 }
  
 L=luaL_newstate();
 luaopen_base(L);  // load basic libs (eg. print)
 luaL_openlibs(L); // load all the lua libs (gives us math string functions etc.)
 luaopen_lua_pocman(L);   // load the wrapped module
 if (luaL_loadfile(L,argv[1])==0) // load and run the file
     lua_pcall(L,0,0,0);
 else
     printf("unable to load %s\n",argv[1]);
 lua_close(L);
 return 0;
}


// li.c
// Lua Barebones Interpreter
//
// 2022-08-04	PV

#include <stdio.h>
#include <string.h>

#include "..\lua-5.4.4\src\lua.h"
#include "..\lua-5.4.4\src\lauxlib.h"
#include "..\lua-5.4.4\src\lualib.h"

int main(void)
{
	printf("Lua barebones interpreter\nEnter commands, ^z or ^d to end loop\n\n");
	char buff[256];
	int error;
	lua_State *L = luaL_newstate(); /* opens Lua */
	luaL_openlibs(L);				/* opens the standard libraries */
	while (fgets(buff, sizeof(buff), stdin) != NULL)
	{
		error = luaL_loadstring(L, buff) || lua_pcall(L, 0, 0, 0);
		if (error)
		{
			fprintf(stderr, "%s\n", lua_tostring(L, -1));
			lua_pop(L, 1); /* pop error message from the stack */
		}
	}
	lua_close(L);
	return 0;
}

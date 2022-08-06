// lstack.c
// Play with Lua stack in C
//
// 2022-08-06	PV

#include <stdio.h>
#include <string.h>

// In c_cpp_properties.json, include "C:\Development\GitHub\Development\Lua\lua-5.4.4\src" into configurations.includePath
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

static void stackDump(lua_State *L)
{
	int i;
	int top = lua_gettop(L); /* depth of the stack */
	for (i = 1; i <= top; i++)
	{ /* repeat for each level */
		int t = lua_type(L, i);
		switch (t)
		{
		case LUA_TSTRING:
		{ /* strings */
			printf("'%s'", lua_tostring(L, i));
			break;
		}
		case LUA_TBOOLEAN:
		{ /* Booleans */
			printf(lua_toboolean(L, i) ? "true" : "false");
			break;
		}
		case LUA_TNUMBER:
		{							 /* numbers */
			if (lua_isinteger(L, i)) /* integer? */
				printf("%lld", lua_tointeger(L, i));
			else /* float */
				printf("%g", lua_tonumber(L, i));
			break;
		}
		default:
		{ /* other values */
			printf("%s", lua_typename(L, t));
			break;
		}
		}
		printf(" "); /* put a separator */
	}
	printf("\n"); /* end the listing */
}

int main(void)
{
	printf("Lua Stack\n\n");
	lua_State *L = luaL_newstate(); /* opens Lua */
	luaL_openlibs(L);				/* opens the standard libraries */

	stackDump(L);
	lua_pushnumber(L, 3.5);			// 3.5
	stackDump(L);
	lua_pushstring(L, "hello");		// 3.5  'Hello'
	stackDump(L);
	lua_pushnil(L);					// 3.5  'Hello'  nil
	stackDump(L);
	lua_rotate(L, 1, -1);			// 'Hello'  nil  3.5  
	stackDump(L);
	lua_pushvalue(L, -2);			// 'Hello'  nil  3.5  nil
	stackDump(L);
	lua_remove(L, 1);				// nil  3.5  nil
	stackDump(L);
	lua_insert(L, -2);				// nil  nil  3.5
	stackDump(L);

	lua_close(L);
	return 0;
}

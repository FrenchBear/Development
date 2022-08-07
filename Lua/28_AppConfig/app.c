// app.c
// Use Lua to manage app configuration
//
// 2022-08-06	PV

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdbool.h>

// In c_cpp_properties.json, include "C:\Development\GitHub\Development\Lua\lua-5.4.4\src" into configurations.includePath
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#define MAX_COLOR 255

struct ColorTable
{
	char *name;
	unsigned char red, green, blue;
} colortable[] = {
	{"WHITE", MAX_COLOR, MAX_COLOR, MAX_COLOR},
	{"RED", MAX_COLOR, 0, 0},
	{"GREEN", 0, MAX_COLOR, 0},
	{"BLUE", 0, 0, MAX_COLOR},
	// ...other colors
	{NULL, 0, 0, 0} // sentinel
};

// assume that table is on top
void setcolorfield(lua_State *L, const char *index, int value)
{
	lua_pushnumber(L, (double)value / MAX_COLOR);
	lua_setfield(L, -2, index);
}

void setcolor(lua_State *L, struct ColorTable *ct)
{
	// lua_newtable(L); // creates a table
	lua_createtable(L, 0, 3); // Small optimization, specifies 3 entries from the beginning
	setcolorfield(L, "red", ct->red);
	setcolorfield(L, "green", ct->green);
	setcolorfield(L, "blue", ct->blue);
	lua_setglobal(L, ct->name); // 'name' = table
}

void error(lua_State *L, const char *fmt, ...)
{
	va_list argp;
	va_start(argp, fmt);
	vfprintf(stderr, fmt, argp);
	va_end(argp);
	lua_close(L);
	exit(EXIT_FAILURE);
}

int getglobint(lua_State *L, const char *var)
{
	int isnum, result;
	lua_getglobal(L, var);
	result = (int)lua_tointegerx(L, -1, &isnum);
	if (!isnum)
		error(L, "'%s' should be a number\n", var);
	lua_pop(L, 1); // remove result from the stack
	return result;
}

int getcolorfield(lua_State *L, const char *key)
{
	int result;
	if (lua_getfield(L, -1, key) != LUA_TNUMBER) // get background[key]
		error(L, "invalid component '%s' in color", key);
	result = (int)(lua_tonumberx(L, -1, NULL) * MAX_COLOR);
	lua_pop(L, 1); // remove number
	return result;
}

void getcolortable(lua_State *L, const char *name, struct ColorTable *pct)
{
	lua_getglobal(L, name);
	if (lua_isstring(L, -1))
	{												 // value is a string?
		const char *colorname = lua_tostring(L, -1); // get string
		int i;										 // search the color table
		for (i = 0; colortable[i].name != NULL; i++)
		{
			if (strcmp(colorname, colortable[i].name) == 0)
				break;
		}
		if (colortable[i].name == NULL) // string not found?
			error(L, "invalid color name (%s)", colorname);
		else
		{ // use colortable[i]
			pct->red = colortable[i].red;
			pct->green = colortable[i].green;
			pct->blue = colortable[i].blue;
		}
	}
	else if (lua_istable(L, -1))
	{
		pct->red = getcolorfield(L, "red");
		pct->green = getcolorfield(L, "green");
		pct->blue = getcolorfield(L, "blue");
	}
	else
		error(L, "invalid value for 'background'");
}

inline void printcolortable(const char *name, struct ColorTable *pct)
{
	printf("%s: r=%d g=%d b=%d\n", name, pct->red, pct->green, pct->blue);
}

// Dedicated implementation calling a function 'f1' defined in Lua
double f1(lua_State *L, double x, double y)
{
	int isnum;
	double z;
	// push functions and arguments
	lua_getglobal(L, "f1"); // function to be called
	lua_pushnumber(L, x);	// push 1st argument
	lua_pushnumber(L, y);	// push 2nd argument
	// do the call (2 arguments, 1 result)
	if (lua_pcall(L, 2, 1, 0) != LUA_OK)
		error(L, "error running function 'f': %s",
			  lua_tostring(L, -1));
	// retrieve result
	z = lua_tonumberx(L, -1, &isnum);
	if (!isnum)
		error(L, "function 'f' should return a number");
	lua_pop(L, 1); // pop returned value
	return z;
}

// Generic vararg Lua function caller
void call_va(lua_State *L, const char *func, const char *sig, ...)
{
	va_list vl;
	int narg, nres; // number of arguments and results
	va_start(vl, sig);
	lua_getglobal(L, func); // push function

	// Push and count arguments
	for (narg = 0; *sig; narg++)
	{ // repeat for each argument
		// check stack space
		luaL_checkstack(L, 1, "too many arguments");
		switch (*sig++)
		{
		case 'd': // double argument
			lua_pushnumber(L, va_arg(vl, double));
			break;
		case 'i': // int argument
			lua_pushinteger(L, va_arg(vl, int));
			break;
		case 'b': // bool argument
			lua_pushboolean(L, va_arg(vl, bool));
			break;
		case 's': // string argument
			lua_pushstring(L, va_arg(vl, char *));
			break;
		case '>':		  // end of arguments
			goto endargs; // break the loop
		default:
			error(L, "invalid option (%c)", *(sig - 1));
		}
	}
endargs:

	nres = (int)strlen(sig);			  // number of expected results
	if (lua_pcall(L, narg, nres, 0) != 0) // do the call
		error(L, "error calling '%s': %s", func,
			  lua_tostring(L, -1));

	// Retrieve results
	nres = -nres; // stack index of first result
	while (*sig)
	{ // repeat for each result
		switch (*sig++)
		{
		case 'd': // double result
		{
			int isnum;
			double n = lua_tonumberx(L, nres, &isnum);
			if (!isnum)
				error(L, "wrong result type");
			*va_arg(vl, double *) = n;
		}
		break;
		case 'i': // int result
		{
			int isnum;
			// Beware that lua_tointegerx retuns a 64-bit long long...
			int n = (int)lua_tointegerx(L, nres, &isnum);
			if (!isnum)
				error(L, "wrong result type");
			*va_arg(vl, int *) = n;
		}
		break;
		case 'b': // bool result
		{
			bool b = (bool)lua_toboolean(L, nres); // Conversion to bool is always successful
			*va_arg(vl, bool *) = b;
		}
		break;
		case 's': // string result
		{
			const char *s = lua_tostring(L, nres);
			if (s == NULL)
				error(L, "wrong result type");
			*va_arg(vl, const char **) = s;
		}
		break;
		default:
			error(L, "invalid option (%c)", *(sig - 1));
		}
		nres++;
	}

	va_end(vl);
}

int main(void)
{
	printf("App Config\n\n");
	lua_State *L = luaL_newstate(); // opens Lua
	luaL_openlibs(L);				// opens the standard libraries

	// Create named colors
	int i = 0;
	while (colortable[i].name != NULL)
		setcolor(L, &colortable[i++]);

	// Read file
	if (luaL_loadfile(L, "app_conf.lua") || lua_pcall(L, 0, 0, 0))
		error(L, "cannot run config. file: %s", lua_tostring(L, -1));

	// Get variables
	int w = getglobint(L, "Width");
	int h = getglobint(L, "Height");
	printf("w=%d\nh=%d\n\n", w, h);

	struct ColorTable Background, Foreground, Border;
	getcolortable(L, "Background", &Background);
	printcolortable("Background", &Background);
	getcolortable(L, "Foreground", &Foreground);
	printcolortable("Foreground", &Foreground);
	getcolortable(L, "Border", &Border);
	printcolortable("Border", &Border);
	printf("\n");

	// Call a function, dedicated version
	printf("Dedicated function call\n");
	printf("f1(0.2, 0.5) = %f\n", f1(L, 0.2, 0.5));
	printf("f1(-2, 1) = %f\n\n", f1(L, -2, 1)); // Dedicated function with a prototype, C compiler promotes automatically int to double for arguments

	// Call a function, generic version
	double z;
	printf("Generic function call\n");
	call_va(L, "f1", "dd>d", 0.2, 0.5, &z);
	printf("f1(0.2, 0.5) = %f\n", z);
	call_va(L, "f1", "dd>d", -2.0, 1.0, &z); // It's a variadic function, it's important that double args contains a dot
	printf("f1(-2, 1) = %f\n", z);

	lua_close(L);
	return 0;
}

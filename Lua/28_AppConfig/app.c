// app.c
// Use Lua to manage app configuration
//
// 2022-08-06	PV

#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
	{NULL, 0, 0, 0} /* sentinel */
};

/* assume that table is on top */
void setcolorfield(lua_State *L, const char *index, int value)
{
	lua_pushnumber(L, (double)value / MAX_COLOR);
	lua_setfield(L, -2, index);
}

void setcolor(lua_State *L, struct ColorTable *ct)
{
	//lua_newtable(L); /* creates a table */
	lua_createtable(L, 0, 3);	// Small optimization, specifies 3 entries from the beginning
	setcolorfield(L, "red", ct->red);
	setcolorfield(L, "green", ct->green);
	setcolorfield(L, "blue", ct->blue);
	lua_setglobal(L, ct->name); /* 'name' = table */
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
	lua_pop(L, 1); /* remove result from the stack */
	return result;
}

int getcolorfield(lua_State *L, const char *key)
{
	int result;
	if (lua_getfield(L, -1, key) != LUA_TNUMBER) /* get background[key] */
		error(L, "invalid component '%s' in color", key);
	result = (int)(lua_tonumberx(L, -1, NULL) * MAX_COLOR);
	lua_pop(L, 1); /* remove number */
	return result;
}

void getcolortable(lua_State *L, const char *name, struct ColorTable *pct)
{
	lua_getglobal(L, name);
	if (lua_isstring(L, -1))
	{												 /* value is a string? */
		const char *colorname = lua_tostring(L, -1); /* get string */
		int i;										 /* search the color table */
		for (i = 0; colortable[i].name != NULL; i++)
		{
			if (strcmp(colorname, colortable[i].name) == 0)
				break;
		}
		if (colortable[i].name == NULL) /* string not found? */
			error(L, "invalid color name (%s)", colorname);
		else
		{ /* use colortable[i] */
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

int main(void)
{
	printf("App Config\n\n");
	lua_State *L = luaL_newstate(); /* opens Lua */
	luaL_openlibs(L);				/* opens the standard libraries */

	// Create named colors
	int i = 0;
	while (colortable[i].name != NULL)
		setcolor(L, &colortable[i++]);

	if (luaL_loadfile(L, "app_conf.lua") || lua_pcall(L, 0, 0, 0))
		error(L, "cannot run config. file: %s", lua_tostring(L, -1));

	int w = getglobint(L, "Width");
	int h = getglobint(L, "Height");
	printf("w=%d\nh=%d\n", w, h);

	struct ColorTable Background, Foreground, Border;
	getcolortable(L, "Background", &Background);
	printcolortable("Background", &Background);
	getcolortable(L, "Foreground", &Foreground);
	printcolortable("Foreground", &Foreground);
	getcolortable(L, "Border", &Border);
	printcolortable("Border", &Border);

	lua_close(L);
	return 0;
}

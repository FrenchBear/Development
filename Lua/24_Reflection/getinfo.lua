-- getinfo.lua
-- Learning Lua, play with reflection, introspection functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


-- debug.getinfo(foo):
-- for a function foo, it returns a table with the following fields:
-- source: This field tells where the function was defined. If the function was defined in a string (through a call to load), source is that string. If the function was defined in a file, source is the file name prefixed with an at-sign.
-- short_src: This field gives a short version of source (up to 60 characters). It is useful for error messages.
-- linedefined: This field gives the number of the first line in the source where the function was defined.
-- lastlinedefined: This field gives the number of the last line in the source where the function was defined.
-- what: This field tells what this function is. Options are "Lua" if foo is a regular Lua function, "C" if it is a C function, or "main" if it is the main part of a Lua chunk.
-- name: This field gives a reasonable name for the function, such as the name of a global variable that stores this function. (only when foo is stack level)
-- namewhat: This field tells what the previous field means. This field can be "global", "local", "method", "field", or "" (the empty string). The empty string means that Lua did not find a name for the function.
-- nups: This is the number of upvalues of that function.
-- nparams: This is the number of parameters of that function.
-- isvararg: This tells whether the function is variadic (a Boolean).
-- activelines: This field is a table representing the set of active lines of the function.
-- func: This field has the function itself.
--
-- When foo is a C function, Lua does not have much data about it. For such functions, only the fields what, name, namewhat, nups, and func are meaningful.
--
-- When foo is a number, we get data about the function active at that stack level.  Leven 0 returns info about getinfo itself, a C function.
--
-- To limit performance issues, 2nd parameter of getinfo is a string, where each letter selects a group of fields, according to the following table:
-- n selects name and namewhat
-- f selects func
-- S selects source, short_src, what, linedefined, and lastlinedefined
-- l selects currentline
-- L selects activelines
-- u selects nup, nparams, and isvararg

function PrintInfo(foo)
    for k, v in pairs(debug.getinfo(foo)) do
        if k ~= "func" then
            print(string.format("%-15s %q", k, v))
        else
            io.write('func            ')
            print(v)
        end
    end
end

PrintInfo(PrintInfo)
print()

function InCall()
    PrintInfo(1)
end

InCall()
print()

function Traceback()
    for level = 1, math.huge do
        local info = debug.getinfo(level, "Sln")
        if not info then break end
        if info.what == "C" then -- is a C function?
            print(string.format("%d\tC function", level))
        else -- a Lua function
            print(string.format("%d\t[%s]: %s, line %d", level, info.short_src, info.name, info.currentline))
        end
    end
end

local function c() Traceback() end
local function b() c() end
local function a() b() end
a()

-- nonlocal.lua
-- Learning Lua, play with reflection, introspection functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


-- The debug library also allows us to access the non-local variables used by a Lua function, with getupvalue.
-- Unlike local variables, the non-local variables referred by a function exist even when the function
-- is not active (this is what closures are about, after all). Therefore, the first argument for getupvalue is
-- not a stack level, but a function (a closure, more precisely). The second argument is the variable index.
-- Lua numbers non-local variables in the order in which they are first referred in a function, but this order
-- is not relevant, because a function cannot access two non-local variables with the same name.
-- We can also update non-local variables, with debug.setupvalue. As you might expect, it has three
-- parameters: a closure, a variable index, and the new value. Like setlocal, it returns the name of the
-- variable, or nil if the variable index is out of range.


-- getvarvalue shows how we can access the value of a variable from a calling function, given the variable's name.
local function getvarvalue(name, level, isenv)
    local value
    local found = false
    level = (level or 1) + 1

    -- try local variables
    for i = 1, math.huge do
        local n, v = debug.getlocal(level, i)
        if not n then break end
        if n == name then
            value = v
            found = true
        end
    end
    if found then return "local", value end

    -- try non-local variables
    local func = debug.getinfo(level, "f").func
    for i = 1, math.huge do
        local n, v = debug.getupvalue(func, i)
        if not n then break end
        if n == name then return "upvalue", v end
    end
    if isenv then return "noenv" end -- avoid loop

    -- not found; get value from the environment
    local _, env = getvarvalue("_ENV", level, true)
    if env then
        return "global", env[name]
    else -- no _ENV available
        return "noenv"
    end
end

local a = 4; print(getvarvalue("a")) --> local 4
A = "xx"; print(getvarvalue("A")) --> global xx

-- getlocal.lua
-- Learning Lua, play with reflection, introspection functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")


-- debug.getlocal inspects the local variables of any active function.
-- This function has two parameters, the stack level of the function we are querying and a variable index.
-- It returns two values: the name and the current value of the variable.
-- If the variable index is larger than the number of active variables, retuns nil.
-- Negative indices get information about the extra arguments of a variadic function:
-- index -1 refers to the first extra argument. The name of the variable in this case is always "(*vararg)".

local function foo(a, b)
    local x
    do local c = a - b end      -- so variable c will be out of scope just after that
    local i = 1
    while true do
        local name, value = debug.getlocal(1, i)
        if not name then break end
        print(name, value)
        i = i + 1
    end
end

foo(10, 20)

-- We can also change the values of local variables, with debug.setlocal. Its first two parameters are a
-- stack level and a variable index, like in getlocal. Its third parameter is the new value for the variable.
-- It returns the variable name or nil if the variable index is out of scope.

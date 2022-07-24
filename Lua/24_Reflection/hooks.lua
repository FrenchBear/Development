-- coroutines.lua
-- Learning Lua, play with reflection, introspection functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- The hook mechanism of the debug library allows us to register a function to be called at specific events as a program runs.
-- There are four kinds of events that can trigger a hook:
-- • call events happen every time Lua calls a function;
-- • return events happen every time a function returns;
-- • line events happen when Lua starts executing a new line of code;
-- • count events happen after a given number of instructions. (Instructions here mean internal opcodes)

-- As a simple example, the following code installs a primitive tracer, which prints each line the interpreter executes:
debug.sethook(print, "l")

local function fact(n) return n <= 1 and 1 or n * fact(n - 1) end

print(fact(4))
debug.sethook()
print()

-- A bit more sophisticated
local function trace(event, line)
    local s = debug.getinfo(2).short_src
    print(s .. ":" .. line)
end

debug.sethook(trace, "l")
print(fact(4))
debug.sethook()
print()

-- Hook for counting number of calls
local Counters = {}
local Names = {}
local function hook()
    local f = debug.getinfo(2, "f").func
    local count = Counters[f]
    if count == nil then -- first time 'f' is called?
        Counters[f] = 1
        Names[f] = debug.getinfo(2, "Sn")
    else -- only increment the counter
        Counters[f] = count + 1
    end
end

local f = assert(loadfile("getlocal.lua"))
debug.sethook(hook, "c")
f()
debug.sethook()
print()

-- Because function names in Lua are so uncertain, we add to each function its location, given as a pair file:line.
local function getname(func)
    local n = Names[func]
    if n.what == "C" then
        return n.name
    end
    local lc = string.format("[%s]: %d", n.short_src, n.linedefined)
    if n.what ~= "main" and n.namewhat ~= "" then
        return string.format("%s (%s)", lc, n.name)
    else
        return lc
    end
end

for func, count in pairs(Counters) do
    print(getname(func), count)
end

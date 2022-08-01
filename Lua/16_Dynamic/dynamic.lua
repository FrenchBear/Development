-- dynamic.lua
-- Learning Lua, playing with dynamic loading
--
-- 2022-06-28   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local expression = "1+2*3^4"
local res = load("return " .. expression)()
print(expression .. " = " .. res)

-- Can refer to global variables in a loaded script, here global x
local functext = "1.5+math.sin(x)+1/3*math.cos(3*x)"
local func = load("return " .. functext)
if func == nil then error("Invalid function") end
for i = 0, 2 * math.pi, math.pi / 20 do
    _G.x = i
    local y, msg = func()
    print(string.rep(" ", math.floor(y * 20 + 0.5)) .. "*")
end

-- Nothing is defined until function returned by load has been executed
local f = load([[
function double(x)
    return 2*x
end
]])
assert(f)

print(_G['double']) -- nil, double is not defined (use strange syntax to avoid VSCode lua linter warning)
f() -- execution, defines double
print(_G['double'](4)) -- now it is defined

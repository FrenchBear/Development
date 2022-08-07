-- func.lua
-- Functions in Lua
-- Exercise 9.1, write a function integrating a function passed as parameter
--
-- 2022-06-28   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


-- Simple sum of trapezes surface
local function integral_trapezes(f, from, to, steps)
    local sum = 0
    local x = from
    local delta = (to - from) / steps
    for i = 0, steps do
        local y = f(x)
        if i == 0 or i == steps then
            sum = sum + y / 2
        else
            sum = sum + y
        end
        x = x + delta
    end
    return delta * sum
end

-- Simpson's method
local function integral_simpson(f, from, to, steps)
    local sum = f(from) + f(to)
    local h2 = (to - from) / (2 * steps)
    local x = from + h2
    local k = 4
    for i = 1, 2 * steps - 1 do
        sum = sum + k * f(x)
        k = 6 - k
        x = x + h2
    end
    return h2 / 3 * sum
end

local n = 10000

local i1t = integral_trapezes(function(x) return x * x end, 0, 1, n)
print("Tr " .. n .. " steps, ∫x=0,1 x²dx = ", i1t)

local i1s = integral_simpson(function(x) return x * x end, 0, 1, n)
print("Si " .. n .. " steps, ∫x=0,1 x²dx = ", i1s)


local i2t = integral_trapezes(function(x) return math.sin(math.log(x)) end, 1e-6, 1, n)
print("Tr " .. n .. " steps, ∫x=0,1 sin(ln(x))dx = ", i2t)

local i2s = integral_simpson(function(x) return math.sin(math.log(x)) end, 1e-6, 1, n)
print("Si " .. n .. " steps, ∫x=0,1 sin(ln(x))dx = ", i2s)

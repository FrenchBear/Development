-- permutations.lua
-- Learning Lua, play with coroutines, example of coroutine as an iterator
-- Shows "manual packaging" and the simplified version using coroutine.wrap()
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local function permgen(a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i = 1, n do
            -- put i-th element as the last one
            a[n], a[i] = a[i], a[n]
            -- generate all permutations of the other elements
            permgen(a, n - 1)
            -- restore i-th element
            a[n], a[i] = a[i], a[n]
        end
    end
end

local function permutations(a)
    local co = coroutine.create(function() permgen(a) end)
    return function() -- iterator
        local code, res = coroutine.resume(co)
        return res
    end
end

-- Previous pattern is so common that a special function coroutine.wrap implements it:
function Permutations(a)
    return coroutine.wrap(function() permgen(a) end)
end

for p in permutations { "a", "b", "c" } do
    print(table.concat(p, ", "))
end
print()

for p in Permutations { "A", "B", "C" } do
    print(table.concat(p, ", "))
end

-- iterate.lua
-- Learning Lua, play with iterators
--
-- 2022-07-06   PV
--
-- Return all subsets of a given set: See set.lua

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

-- The for loop calls its iterator function with two arguments: the invariant state and the control variable.
-- Generator returns three values: the function the iterator function, the invariant state, and initial value for the control variable

-- Exercise 18.1
-- Simple stateless int iterator from start to stop -- included, we're not un Python :-)
function Range1(start, stop)
    return function(inv, ctl)
        ctl = ctl + 1
        if ctl <= stop then return ctl end
    end, nil, start - 1
end

print("Stateless iterator")
for i in Range1(5, 7) do print(i) end

-- Stateful int iterator (captures start)
function Range2(start, stop)
    return function()
        if start <= stop then
            local res = start
            start = start + 1
            return res
        end
    end
end

print("\nStateful iterator")
for i in Range1(5, 7) do print(i) end


-- Add a step variable to Range (exercise 18.2)
function RangeStep(start, stop, step0)
    return function(step, ctl)
        ctl = ctl + step
        if step > 0 and ctl <= stop or step < 0 and ctl <= stop then return ctl end
    end, step0 or 1, start - (step0 or 1)
end

print("\nStateless Step iterator")
for i in RangeStep(0, 8, 2) do print(i) end


-- Iterator over keys sorted using provided function(key, value), default is sorted by keys
function PairsSorted(t, f)
    f = f or function(k, v) return k end
    local keys = {}
    for k in pairs(t) do
        keys[#keys + 1] = k
    end
    -- Remember, sorting function must provide strict order, <= will make it fail (invalid order function for sorting)
    table.sort(keys, function(a, b) return f(a, t[a]) < f(b, t[b]) end)
    local i = 0
    -- Use a simple iterator, that's enough since PairsSorted capture already contains tables t and keys
    return function()
        i = i + 1
        if i <= #keys then return keys[i], t[keys[i]] end
    end
end

local tt = { pomme = 3, poire = 2, ananas = 7, cerise = 5, fraise = 0, banane = 2 }
print("\nSorted by keys")
for k, v in PairsSorted(tt) do
    print(k, v)
end

print("\nSorted by values")
for k, v in PairsSorted(tt, function(k, v) return v end) do
    print(k, v)
end


-- Return all non-empty substrings of a string (exercise 18.4)
function AllSubstrings(s)
    local i = 1
    local l = #s
    return function()
        if l == 0 then return nil end
        local r = s:sub(i, i + l - 1)
        if i + l > #s then
            i = 1
            l = l - 1
        else
            i = i + 1
        end
        return r
    end
end

local name = "flower"
print("\nAll substrings of " .. name)
for s in AllSubstrings(name) do
    print(s)
end

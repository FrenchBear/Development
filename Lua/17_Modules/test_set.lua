-- Tests of Set module
-- Learning Lua, play with modules
--
-- 2022-06-30   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- With a clean module, require result must be assigned to a name (just require "set" does nothing useful)
Set = require "set"

local s = Set:new()
s:addRange({ "c", "l", "a", "s", "s", "e" })
print(s)
print("Count", #s)
for v in s:items() do
    print(v)
end
print()

s:clear()
for i = 1, 10 do
    s:add(math.random(1, 6))
end
print(s)
print()

local s2 = Set:new(nil, { 0, 2, 4, 6, 8, 10, 12 })
local s3 = Set:new(nil, { 0, 3, 6, 9, 12 })
print("s2", s2)
print("s3", s3)
local su = s2:union(s3)
print("s2∪s3", su)
local si = s2:inter(s3)
print("s2∩s3", si)

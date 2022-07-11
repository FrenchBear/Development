-- mt.lua
-- Learning Lua, play with metatables
--
-- 2022-07-11   PV      First version
-- Also check counter.lua in 14_Collections for a clean indexed class example

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")


-- Protect metatable information
print("Protected metatable")

local mt1 = {
    __metatable = "Not your business",
    get_prop = function(self)
        return self.prop
    end
}
mt1.__index = mt1

local t1 = { prop = 123 }
setmetatable(t1, mt1)
print(t1:get_prop())
print(getmetatable(t1))


-- Table with default values
print("\nTable with default values")

local function setDefault(t, d)
    local mt = { __index = function() return d end }
    setmetatable(t, mt)
end

local tab = { x = 10, y = 20 }
print(tab.x, tab.z) --> 10 nil
setDefault(tab, 11)
print(tab.x, tab.z) --> 10 11


-- Table with default values, v2, use property __default__ to store default value
local mt2 = { __index = function(t) return t.__default__ end }
function setDefault(t, d)
    t.__default__ = d
    setmetatable(t, mt2)
end

local t2 = { x = 10, y = 20 }
setDefault(t2, 22)
print(t2.x, t2.z) --> 10 22


-- Table with default values, v3, use a exclusive table as a key for defaulf value, so no names clashes
local defaultkey = {} -- unique key
local mt3 = { __index = function(t) return t[defaultkey] end }
function setDefault(t, d)
    t[defaultkey] = d
    setmetatable(t, mt3)
end

local t3 = { x = 10, y = 20 }
setDefault(t3, 33)
print(t3.x, t3.z) --> 10 33


-- Tracking table access
print("\nTracking table access")

local function track(t)
    local proxy = {} -- proxy table for 't'
    -- create metatable for the proxy
    local mt = {
        __index = function(_, k)
            print("*access to element " .. tostring(k))
            return t[k] -- access the original table
        end,
        __newindex = function(_, k, v)
            print("*update of element " .. tostring(k) ..
                " to " .. tostring(v))
            t[k] = v -- update original table
        end,
        __pairs = function()
            return function(_, k) -- iteration function
                local nextkey, nextvalue = next(t, k)
                if nextkey ~= nil then -- avoid last value
                    print("*traversing element " .. tostring(nextkey))
                end
                return nextkey, nextvalue
            end
        end,
        __len = function() return #t end
    }
    setmetatable(proxy, mt)
    return proxy
end

local ta = {} -- an arbitrary table
ta = track(ta)
ta[2] = "hello"
print(ta[2])
for k, v in pairs(ta) do print(k, v) end


-- Readonly table
print("\nReadonly table")

local function readOnly(t)
    local proxy = {}
    local mt = { -- create metatable
        __index = t,
        __newindex = function(t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

local days = readOnly { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
print(days[1])
local function setNoDay()
    days[2] = "Noday"
end

local ok, msg = pcall(setNoDay)
if ok then
    print("All good")
else
    print("Error: " .. msg)
end


-- Indexed string
print("\nIndexed string")

local function stringAsArray(s)
    local proxy = {}
    local mt = {
        __index = function(_, k)
            return string.sub(s, k, k)
        end,

        __newindex = function(_, k, v)
            s = s:sub(1, k - 1) .. v .. s:sub(k + 1)
        end,

        __tostring = function() return s end,

        __pairs = function()
            return function(_, k) -- iteration function
                k = k + 1
                if k <= #s then
                    return k, s:sub(k, k)
                else
                    return nil
                end
            end, nil, 0
        end,

        __len = function() return #s end
    }
    setmetatable(proxy, mt)
    return proxy
end

local is = stringAsArray("Bonjour")
print(is[4])
is[4] = 's'
is[6] = 'i'
print(is)

for k, v in pairs(is) do
    print(k, v)
end


-- File as array (read only)
local function fileAsArray(filename)
    local f = assert(io.open(filename, "r"))
    local s = f:read("a")
    f:close()
    return stringAsArray(s)
end

print("\nFile as array")
local fa = fileAsArray("mt.lua")
print("len=" .. #fa)
for k, c in pairs(fa) do
    if k == 49 then break end
    io.write(c)
end
print()

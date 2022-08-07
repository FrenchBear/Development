-- multiple_inherit.lua
-- Learning Lua, object-oriented programming, multiple inheritance
--
-- 2022-07-13   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

require "account"

-- look up for 'k' in list of tables 'plist'
local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k] -- try 'i'-th superclass
        if v then return v end
    end
end

local function createClass(...)
    local c = {} -- new class
    local parents = { ... } -- list of parents
    -- class searches for absent methods in its list of parents
    setmetatable(c, { __index = function(t, k)
        local v = search(k, parents)
        t[k] = v -- save for next access, so it's as fast as local method except for 1st access
        -- drawback, it's difficult to change methods definitions after it's duplicated in cache
        return v
    end })
    -- prepare 'c' to be the metatable of its instances
    c.__index = c
    -- define a new constructor for this new class
    function c:new(o)
        o = o or {}
        setmetatable(o, c)
        return o
    end

    return c -- return new class
end

-- Create a simple class to use along Account
Named = {}
function Named:getname()
    return self.name
end

function Named:setname(n)
    self.name = n
end

-- Create a new class NamedAccount that is a subclass of both Account and Named:
NamedAccount = createClass(Account, Named)

local account = NamedAccount:new { name = "Paul" }
account:deposit(750)
print(account:getname())
print(account.balance)

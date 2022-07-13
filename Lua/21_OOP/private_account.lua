-- private_account.lua
-- Learning Lua, object-oriented programming, how to implement private members
--
-- 2022-07-13   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

print("Private self")
local function newAccount(initialBalance)
    -- private internal state
    local self = { balance = initialBalance }

    local withdraw = function(v)
        self.balance = self.balance - v
    end

    local deposit = function(v)
        self.balance = self.balance + v
    end

    local getBalance = function() return self.balance end

    return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }
end

local a = newAccount(1000)
-- there is no way to access intername table self created in NewAccount and its
-- members directly here, we can only use functions
-- Note: function calls using . and not :
a.withdraw(250)
print(a.getBalance())




-- Single method approach
print("\nSingle method approach")
local function newObject(value)
    return function(action, v)
        if action == "get" then return value
        elseif action == "set" then value = v
        else error("invalid action")
        end
    end
end

local d = newObject(0)
print(d("get")) --> 0
d("set", 10)
print(d("get")) --> 10



-- Using dual representaton
print("\nDual representation")
local balance = {}

AccountDualPrivate = {}
function AccountDualPrivate:withdraw(v)
    balance[self] = balance[self] - v
end

function AccountDualPrivate:deposit(v)
    balance[self] = balance[self] + v
end

function AccountDualPrivate:balance()
    return balance[self]
end

function AccountDualPrivate:new(o)
    o = o or {} -- create table if user does not provide one
    setmetatable(o, self)
    self.__index = self
    balance[o] = 0 -- initial balance
    return o
end

local adp = AccountDualPrivate:new{}
adp:deposit(100.00)
print(adp:balance())

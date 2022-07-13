-- account.lua
-- Learning Lua, object-oriented programming, Account class
--
-- 2022-07-13   PV      First version

-- Example of base class
Account = { balance = 0 }
function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:withdraw(v)
    if v > self.balance then error "insufficient funds" end
    self.balance = self.balance - v
end

-- Derived class
SpecialAccount = Account:new()

-- Override withdraw for SpecialAccount
function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then
        error "insufficient funds"
    end
    self.balance = self.balance - v
end

-- Provide getLimit for SpecialAccount
function SpecialAccount:getLimit()
    return self.limit or 0
end

if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    os.execute("chcp 65001 >NUL")

    local s = SpecialAccount:new { balance = 500, limit = 1000.00 }
    s:withdraw(700)
    print(s.balance)
end

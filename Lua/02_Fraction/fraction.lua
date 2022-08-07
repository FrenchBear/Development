-- fraction.lua
-- Very first test of a class in lua
--
-- 2022-06-06   PV
-- 2022-06-26   PV      to_period

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

Fraction = {
    n = 0,
    d = 1,

    __classname = "Fraction", -- non standard!

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        local p = Fraction.pgdc(object.n, object.d)
        if p > 1 then
            object.n = object.n // p
            object.d = object.d // p
        end
        -- Only numerator bears sign
        if object.d < 0 then
            object.n = -object.n
            object.d = -object.d
        end
        return object
    end,

    pgdc = function(a, b)
        while true do
            local r = a % b
            if r == 0 then return b end
            a, b = b, r
        end
    end,

    __tostring = function(self)
        if self.d == 1 then
            return tostring(self.n)
        else
            return self.n .. "/" .. self.d
        end
    end,

    print = function(self)
        print(tostring(self))
    end,

    __add = function(self, other)
        return Fraction.new(Fraction, { n = self.n * other.d + other.n * self.d, d = self.d * other.d })
    end,

    __eq = function(self, other)
        return self.n == other.n and self.d == other.d
    end,

    tofloat = function(self)
        return self.n / self.d
    end,

    -- Returns a string of the fraction, with period in brackets
    -- ex: 679/550 returns "1.23[45]" since the fraction is 1.23454545...
    to_period = function(self)
        local n, d = self.n, self.d
        if d == 0 then
            if n == 0 then return ("0/0 undefined") else return ("/0 error") end
        end
        local sint = ""
        if n < 0 or d < 0 then
            if n * d < 0 then sint = "-" end
            n = math.abs(n)
            d = math.abs(d)
        end
        sint = sint .. tostring(n // d)
        local rem = n % d
        if rem == 0 then return sint end
        local sfrac = ""
        local tf = {}
        while true do
            if rem == 0 then return sint .. "." .. sfrac end

            if tf[rem] ~= nil then
                return sint .. "." .. string.sub(sfrac, 1, tf[rem] - 1) .. "[" .. string.sub(sfrac, tf[rem]) .. "]"
            end

            -- record position for reminder and decimal, and continue to next decimal
            tf[rem] = 1 + #sfrac

            rem = rem * 10
            local q = rem // d
            rem = rem % d

            sfrac = sfrac .. q
        end
    end
}

-- implement a metatable for Fraction, so it's possible to call Fraction and implement a "constructor-like" call.
-- It may be simpler to put this inside Fraction and set Fraction as its own metatable, but then is would be possible
-- to call a Fraction instance, which does not make much sense...
MetaFraction = {
    __call = function(self, a, b)
        return Fraction:new({ n = a, d = b })
    end,
}

setmetatable(Fraction, MetaFraction)

local f1 = Fraction.new(Fraction, { n = 1, d = 3 })
local f2 = Fraction:new({ n = 2, d = 3 })

print(f1)
f2:print()
print(f1.__classname)

local f3 = f1 + f2
print(f3)
print(f1 == f2)
print(f1 + f2 == f3)

local pi = Fraction(355, 113)
print("pi ≈ " .. tostring(pi) .. " = " .. pi:tofloat())

--print(f1())
--print(f1(22, 7))

local function test(n, d, r)
    local x = Fraction(n, d):to_period(n, d)
    if x == r then print("Ok", n .. "/" .. d .. " = " .. r) else print('KO', n .. "/" .. d ..
        " found " .. x .. ' expected ' .. r) end
end

test(100, 250, "0.4")
test(100, 4, "25")
test(8, 2, "4")
test(1, 3, "0.[3]")
test(-1, 3, "-0.[3]")
test(1, -3, "-0.[3]")
test(-1, -3, "0.[3]")
test(1, 5, "0.2")
test(1, 7, "0.[142857]")
test(100, 23, "4.[3478260869565217391304]")
test(679, 550, "1.23[45]")
test(0, 5, "0")
-- Can't run these tests since we can't build a fraction object...
-- test(5, 0, "/0 error")
-- test(0, 0, "0/0 undefined")

-- Decimals .[00 01 02 03 ... 96 97 99]
test(1, 9801,
    "0.[000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969799]")

-- fraction.lua
-- Very first test of a class in lua
--
-- 2022-06-06   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

Fraction = {
    n = 0,
    d = 1,

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
}

-- implement a metatable for Fraction, so it's possible to call Fraction and implement a "constructore-like" call.
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

local f3 = f1 + f2
print(f3)
print(f1 == f2)
print(f1 + f2 == f3)

local pi = Fraction(355, 113)
print("pi ≈ " .. tostring(pi) .. " = " .. pi:tofloat())

--print(f1())
--print(f1(22, 7))

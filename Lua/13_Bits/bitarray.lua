-- bitarray.lua
-- Learning lua, bits & bytes manipulation
--
-- 2022-06-23   PV

require "tobinary"

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- Returns binary representation of an integer on 64 positions starting with b0 (reversed)
local function tobinary64reversed(n)
    s = ToBinary(n)
    return string.reverse(string.rep("0", 64 - #s) .. s)
end

BitArray = {

    __classname = "BitArray", -- non standard!

    new = function(self, object, size)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        object.size = size -- Size in bits
        object.words = 1 + (size - 1) // 64
        object.tb = {}
        object:clearall()

        return object
    end,

    setall = function(self)
        for i = 0, self.words - 1 do
            self.tb[i] = ~0
        end
    end,

    clearall = function(self)
        for i = 0, self.words - 1 do
            self.tb[i] = 0
        end
    end,

    setbit = function(self, n)
        if n < 0 or n >= self.size then error("index out of bounds 0.." .. (self.size - 1)) end
        local ix = n // 64
        local off = n % 64
        self.tb[ix] = self.tb[ix] | (1 << off)
    end,

    clearbit = function(self, n)
        if n < 0 or n >= self.size then error("index out of bounds 0.." .. (self.size - 1)) end
        local ix = n // 64
        local off = n % 64
        self.tb[ix] = self.tb[ix] & ~(1 << off)
    end,

    testbit = function(self, n)
        if n < 0 or n >= self.size then error("index out of bounds 0.." .. (self.size - 1)) end
        local ix = n // 64
        local off = n % 64
        return (self.tb[ix] & (1 << off)) ~= 0
    end,

    __tostring = function(self)
        local s = ""
        for i = 0, self.words - 1 do
            s = s .. "<" .. tobinary64reversed(self.tb[i]) .. "> "
        end
        return s
    end
}

-- Test
-- local b = BitArray:new(nil, 200)
-- for i = 1, 70 do
--     --print("Test loop " .. i)
--     b:clear()
--     for j = 0, 199, i do
--         b:setbit(j)
--     end
--     for j = 0, 199 do
--         local t = b:testbit(j)
--         if j % i == 0 and not t or j % i ~= 0 and t then
--             print("Problem i=" .. i .. ", j=.." .. j .. ", j%i=" .. j % i .. ", testbit(j)=" .. t)
--             local a = 0
--         end
--     end
-- end

-- Primes sieve
local st=os.clock()

local verbose = false
local max = 1000000
local b = BitArray:new(nil, max)
b:setall()


if verbose then print("Primes <" .. max) end
local i = 2
local np = 0
while i < max do
    if b:testbit(i) then
        np = np + 1
        if verbose then io.write(i .. " ") end
        for j = i + i + i, max - 1, i + i do b:clearbit(j) end
    end
    if i == 2 then i = 3 else i = i + 2 end
end
print("\n" .. np .. " primes found <" .. max)
print("Elapsed", os.clock()-st)

-- isbinarypalindrome.lua
-- Test if a number binary representation is a palindrome
-- Exercise 13.5
--
-- 2022-06-23   PV

require "binstr"

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local function isParlindrome1(n)
    local s1 = IntToBstr(n)
    local s2 = string.reverse(s1)
    local n3 = BstrToInt(s2)
    return n == BstrToInt(string.reverse(IntToBstr(n)))
end

local function isParlindrome2(n)
    if n == 0 or n == 1 then return true end
    -- Find most significant bit
    local msb, n1 = -1, n
    while n1 ~= 0 do
        msb = msb + 1
        n1 = n1 >> 1
    end
    local lsb = 0
    while lsb < msb do
        local lb = n & (1 << lsb) ~= 0
        local hb = n & (1 << msb) ~= 0
        if lb ~= hb then return false end
        lsb = lsb + 1
        msb = msb - 1
    end
    return true
end

local function test(n, r)
    local p1 = isParlindrome1(n)
    local p2 = isParlindrome2(n)
    print(string.format("%16x", n), p1, p2, r)
    if p1 ~= p2 or p1 ~= r then
        print("problem")
    end
end

test(0, true)
test(1, true)
test(2, false)
test(3, true)
test(0xF00F, true)
test(0xA5, true)
test(0xAAAA5555, true)
test(0xAAAA6555, false)
test(-1, true)
test(-2, false)

-- countbits.lua
-- Count the number of bits in binary representation of an integer
-- Exercise 13.2
--
-- 2022-06-24   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- Shift right 1 bit at a time until result is 0
local function countbits1(n)
    if n == 0 then return 1 end
    local c = 0
    while n ~= 0 do
        c = c + 1
        n = n >> 1
    end
    return c
end

-- Use log in base 2
local function countbits2(n)
    if n == 0 then return 1 end
    local off = 0
    -- problem: math.log(0x7fffffffffffffff, 2) == 63.0 instead of 62.9999999999 because of float limited precision
    -- So we shift right 32 positions to avoid this issue
    if n < 0 or n >= 1 << 32 then
        off = 32
        n = n >> 32
    end
    return math.floor(math.log(n, 2)) + 1 + off
end

-- Shift 32, then 16, then 8... until result is<=2, in which case the number of bits is the result
local function countbits3(n)
    if n == 0 then return 1 end
    local off, p = 0, 32 -- offset, pivot (power of 2)
    while true do
        if n < 0 or n >= 1 << p then
            n = n >> p
            off = off + p
            if n <= 2 then return off + n end
        end
        p = p // 2
    end
end

local function test(n, r)
    local c1 = countbits1(n)
    local c2 = countbits2(n)
    local c3 = countbits3(n)
    print(string.format("%16x", n), c1, c2, c3, r)
    if c1 ~= r or c1 ~= c2 or c1 ~= c3 then
        print("problem")
    end
end

test(0, 1)
test(1, 1)
test(0xD, 4)
test(0x7FFF, 15)
test(0xCAFE, 16)
test(0xFFFF, 16)
test(0xDEADBEEF, 32)
test(1 << 62, 63)
test(0x7fffffffffffffff, 63)
test(1 << 63, 64)
test(-1, 64)

--print(countbits3(-1))

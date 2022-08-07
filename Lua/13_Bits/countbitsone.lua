-- countbitsone.lua
-- Count the number of 1 in binary representation of an integer (Hamming weight)
-- Exercise 13.4
--
-- 2022-06-23   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local function count1(n)
    local c = 0
    if n < 0 then
        c = 1
        n = n & 0x7fffffffffffffff
    end
    while n > 0 do
        if (n & 1) ~= 0 then c = c + 1 end
        n = n >> 1
    end
    return c
end

local hexlen = {
    ['0'] = 0, --'0000',
    ['1'] = 1, --'0001',
    ['2'] = 1, --'0010',
    ['3'] = 2, --'0011',
    ['4'] = 1, --'0100',
    ['5'] = 2, --'0101',
    ['6'] = 2, --'0110',
    ['7'] = 3, --'0111',
    ['8'] = 1, --'1000',
    ['9'] = 2, --'1001',
    ['a'] = 2, --'1010',
    ['b'] = 3, --'1011',
    ['c'] = 2, --'1100',
    ['d'] = 3, --'1101',
    ['e'] = 3, --'1110',
    ['f'] = 4, --'1111',
}
local function count2(n)
    local c, s = 0, string.format("%x", n)
    for i = 1, #s do
        c = c + hexlen[s:sub(i, i)]
    end
    return c
end

-- Count3: divide and conquer
local hexlen2 = {
    [0] = 0, --'0000',
    [1] = 1, --'0001',
    [2] = 1, --'0010',
    [3] = 2, --'0011',
    [4] = 1, --'0100',
    [5] = 2, --'0101',
    [6] = 2, --'0110',
    [7] = 3, --'0111',
    [8] = 1, --'1000',
    [9] = 2, --'1001',
    [10] = 2, --'1010',
    [11] = 3, --'1011',
    [12] = 2, --'1100',
    [13] = 3, --'1101',
    [14] = 3, --'1110',
    [15] = 4, --'1111',
}

local function count3_8(n) return hexlen2[n >> 4] + hexlen2[n & 0xf] end

local function count3_16(n) if n < 16 then return hexlen2[n] else return count3_8(n >> 8) + count3_8(n & 0xff) end end

local function count3_32(n) if n < 16 then return hexlen2[n] else return count3_16(n >> 16) + count3_16(n & 0xffff) end end

local function count3(n) if n >= 0 and n < 16 then return hexlen2[n] else return count3_32(n >> 32) + count3_32(n & 0xffffffff) end end

-- Count 4: unpack bits
local function count4(n)
    local s = string.pack("i8", n)
    local c = 0
    local res
    for i = 1, 8 do
        res = string.unpack("B", s, i)
        c = c + hexlen2[res >> 4] + hexlen2[res & 0xf]
    end
    return c
end

local function test(n, r)
    local c1 = count1(n)
    local c2 = count2(n)
    local c3 = count3(n)
    local c4 = count4(n)
    print(c1, c2, c3, c4)
    if c1 ~= c2 or c1 ~= c3 or c1 ~= c4 or c1 ~= r then
        print("problem")
    end
end

test(0, 0)
test(1, 1)
test(0xD, 3)
test(0xCAFE, 11)
test(0xDEADBEEF, 24)
test(1 << 62, 1)
test(1 << 63, 1)
test(-1, 64)

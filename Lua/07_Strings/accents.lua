-- accents.lua
-- Play with utf8 strings in lua
--
-- 2022-06-09   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local s = "résumé"
print(#s)
print(utf8.len(s))

local s1 = "<![CDATA[\n    Hello world\n]]>"
local s2 = [=[
<![CDATA[
    Hello world
]]>]=]

print(s1 == s2)

-- Insert string fragment before index pos of string str
local function insert(str, pos, fragment)
    return string.sub(str, 1, pos - 1) .. fragment .. string.sub(str, pos)
end

print(insert("hello world", 1, "start: ")) -- start: hello world
print(insert("hello world", 7, "small ")) -- hello small world

-- Delete count characters (bytes) from string str starting at index pos (base 1)
local function remove(str, pos, count)
    return string.sub(str, 1, pos - 1) .. string.sub(str, pos + count)
end

print(remove("hello world", 7, 4)) -- hello d

-- Same thing as insert, but supporting utf8 string.  Pos is utf-8 character index starting at 1
local function insert_utf8(str, pos, fragment)
    local off = utf8.offset(str, pos, 1)
    return string.sub(str, 1, off - 1) .. fragment .. string.sub(str, off)
end

-- Substring of utf8 string, with both pos and len in utf-8 character index (starting at 1) and count
-- Attention, for now, negative values of start have nor been tested (ToDo)
-- len should also be optional (ToDo)
local function sub_utf8(str, pos, len)
    local p1 = utf8.offset(str, pos, 1)
    local p2 = utf8.offset(str, len + 1, p1) or (1 + #str)
    return string.sub(str, p1, p2 - 1)
end

local u1 = "Où ça? Là!"
local u2 = "Aé♫山𝄞🐗"
local u3 = "œæĳøß≤≠Ⅷﬁﬆ"
local u4 = "𝄞𝄡𝄢"
local u5 = "←↑→↓\r￩￪￫￬\r🠀🠁🠂🠃\r🠄🠅🠆🠇\r🠈🠉🠊🠋\r🠐🠑🠒🠓\r🠔🠕🠖🠗\r🠘🠙🠚🠛\r🠜🠝🠞🠟\r🠠🠡🠢🠣\r🠤🠥🠦🠧\r🠨🠩🠪🠫\r🠬🠭🠮🠯\r🠰🠱🠲🠳\r🠴🠵🠶🠷\r🠸🠹🠺🠻\r🠼🠽🠾🠿\r🡀🡁🡂🡃\r🡄🡅🡆🡇\r🡐🡑🡒🡓\r🡠🡡🡢🡣\r🡰🡱🡲🡳\r🢀🢁🢂🢃\r🢐🢑🢒🢓\r🢔🢕🢖🢗\r🢘🢙🢚🢛\r◀▲▶▼\r◁△▷▽\r◂▴▸▾\r⏴⏵⏶⏷"
local u6 = "🐱‍🏍 🐱‍👓 🐱‍🚀 🐱‍👤 🐱‍🐉 🐱‍💻"
local u7 = "🧝 🧝‍♂️ 🧝‍♀️ 🧝🏽 🧝🏽‍♂️ 🧝🏽‍♀️"

print(insert_utf8("hello world", 1, "start: ")) -- start: hello world
print(insert_utf8("hello world", 7, "small ")) -- hello small world
print(insert_utf8(u2, 5, " Key:")) -- Aé♫山 Key:𝄞🐗

local rk = sub_utf8(u4, 2, 1)
print(rk) -- 𝄡
assert(#rk == 4)
assert(utf8.len(rk) == 1)

assert(sub_utf8(u4, 1, 1) == "𝄞")
assert(sub_utf8(u4, 1, 2) == "𝄞𝄡")
assert(sub_utf8(u4, 1, 3) == "𝄞𝄡𝄢")
assert(sub_utf8(u4, 2, 1) == "𝄡")
assert(sub_utf8(u4, 2, 3) == "𝄡𝄢")
assert(sub_utf8(u4, 3, 1) == "𝄢")
assert(sub_utf8(u4, 3, 0) == "")

-- Delete count utf-8 characters (bytes) from string str starting at index pos (base 1)
local function remove_utf8(str, pos, count)
    local off = utf8.offset(str, pos, 1)
    local off2 = utf8.offset(str, count + 1, off)
    return string.sub(str, 1, off - 1) .. string.sub(str, off2)
end

print(remove_utf8(u4, 1, 1))
print(remove_utf8(u4, 2, 1))
print(remove_utf8(u4, 3, 1))


-- Conversions
print(tonumber(" -3 ")) --> -3
print(tonumber(" 10e4 ")) --> 100000.0
print(tonumber("10e")) --> nil (not a valid number)
print(tonumber("0x1.3p-4")) --> 0.07421875
--By default, tonumber assumes decimal notation, but we can specify any base between 2 and 36 for the conversion:
print(tonumber("100101", 2)) --> 37
print(tonumber("fff", 16)) --> 4095
print(tonumber("-ZZ", 36)) --> -1295
print(tonumber("987", 8)) --> nil

print(tostring(10) == "10") --> true

-- Repeat string
print(string.rep("-", 50))

-- Reverse string
print(string.reverse("ABCDEFGH"))

-- Case
print(string.lower("COFFEE42"))
print(string.lower("OÙ ÇA? LÀ!")) -- Only for ASCII characters...  -> oÙ Ça? lÀ!
print(string.upper("attention!"))

-- Format
print(string.format("pi = %.4f", math.pi)) --> pi = 3.1416

-- Locate string in a substring
print(string.find("hello world", "wor")) --> 7 9
print(string.find("hello world", "war")) --> nil


-- Decompose a ITF8 string into individual chars
local sacc = "Où ça? Là!"
for p, c in utf8.codes(sacc) do
    -- p is a byte index
    print(p, c, utf8.char(c))
end
print()

for i = 1, utf8.len(sacc) do
    -- i is a Unicode char index
    local c = utf8.codepoint(sacc, utf8.offset(sacc, i, 1))
    print(i, c, utf8.char(c))
end


-- Exercise 10.7 Reverse a UTF8 string
local function reverseu8(str)
    local r = ""
    for _, c in utf8.codes(str) do
        r=utf8.char(c)..r
    end
    return r
end

print(reverseu8(sacc))      -- !àL ?aç ùO

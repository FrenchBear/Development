-- accents.lua
-- Play with utf8 strings in lua
--
-- 2022-06-09   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

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
    local off2 = utf8.offset(str,  count + 1, off)
    return string.sub(str, 1, off - 1) .. string.sub(str, off2)
end

print(remove_utf8(u4, 1, 1))
print(remove_utf8(u4, 2, 1))
print(remove_utf8(u4, 3, 1))

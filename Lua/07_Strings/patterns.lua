-- patterns.lua
-- Play with patterns in lua
--
-- 2022-06-21   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- plain search
local sonce = "Il était une fois"
local debut, fin = string.find(sonce, "était", 1, true)
print(debut, fin, string.sub(sonce, debut, fin))

-- match a simple string, useless actually since it returns the match
print(string.match(sonce, "était"))

-- replacement
print(string.gsub(sonce, "une", "deux"))
print(string.gsub(sonce, "une", function(m) return "<" .. m .. ">" end))

-- iteration over string match
local hp = "Once Harry had refilled his money bag with gold Galleons, silver Sickles, and bronze Knuts from his vault at Gringotts, he had to exercise a lot of self-control not to spend the whole lot at once. He had to keep reminding himself that he had five years to go at Hogwarts, and how it would feel to ask the Dursleys for money for spellbooks, to stop himself from buying a handsome set of solid gold Gobstones (a wizarding game rather like marbles, in which the stones squirt a nasty-smelling liquid into the other player's face when they lose a point). He was sorely tempted, too, by the perfect, moving model of the galaxy in a large glass ball, which would have meant he never had to take another Astronomy lesson. But the thing that tested Harry's resolution most appeared in his favorite shop, Quality Quidditch Supplies, a week after he'd arrived at the Leaky Cauldron."
local nthe = 0
for w in string.gmatch(hp, "the") do
    nthe = nthe + 1
end
print(nthe .. " fois 'the'")



-- seach a pattern
local sd = "Birth date 26/02/1965 in Chambéry"
local bd = string.match(sd, "%d+/%d+/%d+")
print("Anniversaire: " .. bd)
local dd, mm, aa = string.match(sd, "(%d+)/(%d+)/(%d+)")
print("Format yyyy-mm-dd: " .. aa .. "-" .. string.format("%02d", tonumber(mm)) ..
    "-" .. string.format("%02d", tonumber(dd)))

local html = "<P>\n" .. string.gsub(hp, " *(.-)%.", function(m) return m .. "</BR>\n" end) .. "</P>"
print(html)

io.write("Nom propres:")
for propername in string.gmatch(hp, "%f[A-Z](.-)%f[%W]") do
    io.write(" ", propername)
end
io.write("\n")

local wc = 0
local tc = 0
for w in string.gmatch(hp, "%f[%w].-%f[%W]") do
    io.write("<" .. w .. "> ")
    wc = wc + 1
    tc = tc + #w
end
io.write("\n")
print(wc .. " mots, longueur moyenne " .. string.format("%.1f", tc / wc) .. " caractères")


-- Use () match that returns the position of the empty match
local function expandtabs(s, tab)
    tab = tab or 8
    local corr = 0
    s = string.gsub(s, "()\t", function(p)
        local sp = tab - (p - 1 + corr) % tab -- Tab found in column 3, we need 6 spaces = 8-(3-1)
        corr = corr - 1 + sp
        return string.rep(" ", sp)
    end)
    return s
end

local s1 = "ab      1234    abcdefg h"
local s2 = "ab\t1234\tabcdefg\th"
print(s1)
print(expandtabs(s2))

local function unexpandtabs(s, tab)
    tab = tab or 8
    s = expandtabs(s, tab) -- FIrst expand existing tabs
    s = string.gsub(s, string.rep(".", tab), "%0\1") -- Insert a \1 every tab characters
    s = string.gsub(s, " +\1", "\t") -- Replace every group of spaces followed by \1 by a tab
    s = string.gsub(s, "\1", "") -- Remove remaining \1
    return s
end

-- print("["..unexpandtabs(s1).."]")
-- print("["..s2.."]")
print("Test unexpandtabs", unexpandtabs(s1) == s2)

-- Replacement using global variables.  A variable that doesn't exist is not replaced
Language = 'Lua'
Status = 'great'
print(string.gsub("$(Language) is $(adverb) $(Status)", "$%((%w+)%)", _G))
print()

-- Trim removing spaces and tabs bafore and after a string, using pattern matching
local function trim1(str)
    return string.gsub(str, "^[ \t]*(.-)[ \t]*$", "%1")
end

-- Exercise 10.4
-- More complex trim, but actually simpler, and probably faster
local function trim2(str)
    local s, e = 1, #str
    while s <= e do
        if string.byte(str, s) ~= 32 and string.byte(str, s) ~= 9 then break end
        s = s + 1
    end
    if s < e then
        while e >= s do
            if string.byte(str, e) ~= 32 and string.byte(str, e) ~= 9 then break end
            e = e - 1
        end
    end
    return string.sub(str, s, e)
end

local function test_trim(str)
    local t1 = trim1(str)
    local t2 = trim2(str)
    print("<" .. str .. "> -> <" .. t1 .. ">")
    assert(t1 == t2)
end

test_trim("abc")
test_trim("   def")
test_trim("ghi\t\t")
test_trim(" \t jkl\t \t")
test_trim("")
test_trim(" ")
print()

-- A plain version of string.gsub ignoring patterns
local function plaingsub(str, find, replace)
    find = string.gsub(find, "(%W)", "%%%1") -- Every non-alphanum char is escaped
    replace = string.gsub(replace, "%%", "%%%%") -- In replacement, only % need to be escaped
    return string.gsub(str, find, replace)
end

print(plaingsub('printf("pi=%.4f")', "%.4f", "4.1416"))
print()

-- utf8.charpattern represents one utf8 character
local sacc = "Où ça? Là!"
for c8 in string.gmatch(sacc, utf8.charpattern) do
    io.write(c8, " ")
end
io.write("\n\n")


-- Exercise 10.1 String splitter
local function split(str, char)
    local r = {}
    local char_original = char
    local p1 = 1
    char = string.gsub(char, "(%W)", "%%%1")
    for x in string.gmatch(str, "()" .. char) do
        local pn = tonumber(x)
        r[#r + 1] = string.sub(str, p1, pn - 1)
        p1 = pn + #char_original
    end
    r[#r + 1] = string.sub(str, p1) -- Don't forget last segment
    return r
end

for _, w in ipairs(split("Il était une fois", " ")) do
    print(w)
end
print()

for _, w in ipairs(split("Il était une fois", "Youpla")) do
    print(w)
end
print()

local tt = split("Lua Quick Start Guide (2018) - [Packt] - Gabor Szauer", " - ")
local title = tt[1]
local editor = string.gsub(tt[2], 2, #tt[2] - 2)
local author = tt[3]
print("title:  " .. title, "\neditor: " .. editor, "\nauthor: " .. author)
print()

-- Exercise 10.6
-- Transliterate utf8 string using a mapping utf8 string -> utf8 string
local function transcode_ss(str, from, to)
    local ix = 1
    for _, codefrom in utf8.codes(from) do
        local codeto = utf8.codepoint(to, utf8.offset(to, ix, 1))

        local sfrom, sto
        if codefrom > 127 then
            sfrom = utf8.char(codefrom) -- No need to escape non-ascii chars
        else
            sfrom = string.gsub(string.char(codefrom), "(%W)", "%%%1") -- Every non-alphanum char is escaped
        end

        if codeto > 127 then
            sto = utf8.char(codeto)
        elseif codeto == 37 then
            sto = "%%" -- Only % needs to be escaped in the replacement string
        else
            sto = string.char(codeto)
        end

        str = string.gsub(str, sfrom, sto)
        ix = ix + 1
    end
    return str
end

local avec_acc = "àâäéèêëîïôöûüùÿç"
local sans_acc = "aaaeeeeiioouuuyc"
local uppe_acc = "ÀÂÄÉÈÊËÎÏÔÖÛÜÙŸÇ"
print(transcode_ss("Où ça là abîmé maïs crêpe", avec_acc, sans_acc))
print(transcode_ss("Où ça là abîmé maïs crêpe", avec_acc, uppe_acc))

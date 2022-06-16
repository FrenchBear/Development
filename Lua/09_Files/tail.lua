-- tail.lua
-- Play with files in Lua, print the last n lines of a file
--
-- 2022-06-16   PV

-- Support for UTF8 -> ANSI 1252 conversions
local u8a = require('u8a')

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- local filename_u8 = 'pré.txt'
-- local filename_ansi = u8toansi(filename_u8)
-- local f = assert(io.open(filename_ansi, "r"))

local filename = Utf8toAnsi1252([[Data utf-8\prénoms-utf8.txt]])
local n = 5

-- Read all lines, only keeping the last count lines
local function last1(file, count)
    local lastlines = {}
    local ix = 0
    local f = assert(io.open(filename, "r"))
    for line in f:lines() do
        ix = ix + 1
        lastlines[ix] = line
        if ix > count then lastlines[ix - count] = nil end
    end
    f:close()
    for i = math.max(1, ix - count + 1), ix do
        print(lastlines[i])
    end
end

local function count_lines(a)
    local nlf = 0
    for i = 1, #a do
        -- count \n and (\r not followed by \n)
        if a:byte(i) == 10 or (a:byte(i) == 13 and a:byte(i + 1) ~= 10) then nlf = nlf + 1 end
    end
    return nlf+1
end

-- Using seek to be more efficient
local function last2(file, count)
    local f = assert(io.open(filename, "r"))
    local size = f:seek("end")
    local startpos
    if size < count * 120 then -- Tests, should consized a min of 4K or 8K
        startpos = 0
    else
        startpos = math.max(0, size - count * 120) -- assume 120 chars per line
    end

    local a
    while true do
        f:seek("set", startpos)
        a = f:read("a")
        if startpos == 0 or count_lines(a) > count then break end
        startpos = math.max(0, startpos - count * 120)
    end
    f:close()

    local lp = 1
    local lastlines = {}
    for i = 1, #a do
        if a:byte(i) == 10 or (a:byte(i) == 13 and a:byte(i + 1) ~= 10) then
            if a:byte(i) == 10 and i>1 and a:byte(i-1)==13 then
                lastlines[#lastlines + 1] = string.sub(a, lp, i - 2)
                lp = i + 1
            else
                lastlines[#lastlines + 1] = string.sub(a, lp, i - 1)
                lp = i + 1
            end
        end
    end
    if lp < #a then
        lastlines[#lastlines + 1] = string.sub(a, lp)
    end

    local si = math.min(count, #lastlines)
    for i = 1, si do
        print("<" .. lastlines[#lastlines-si+i] .. ">")
    end
end

last1(filename, n)
last2(filename, n)

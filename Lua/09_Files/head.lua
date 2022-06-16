-- head.lua
-- Play with files in Lua, print the first n lines of a file
--
-- 2022-06-16   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- Unicode codepoint to ANSI map for codepoints 128 to 255, if map[c]~c.
-- Codepoint('Ç')=8364 and ANSI('Ç')=128, so we have [8364]=128 in this table
-- For instance é has both 233 as unicode codepoint and ANSI code, so it's not in this table
local CodepointToAnsiMap = {
    [8364] = 128, [8218] = 130, [402] = 131, [8222] = 132, [8230] = 133, [8224] = 134, [8225] = 135, [710] = 136,
    [8240] = 137, [352] = 138, [8249] = 139, [338] = 140, [381] = 142, [8216] = 145, [8217] = 146, [8220] = 147,
    [8221] = 148, [8226] = 149, [8211] = 150, [8212] = 151, [732] = 152, [8482] = 153, [353] = 154, [8250] = 155,
    [339] = 156, [382] = 158, [376] = 159,
}

-- Convert string from UTF8 to ANSI, useful to handle file names with non-ASCII files but still ANSI-1252 compatible
-- using standard Lua I/O functions.  This is not enough to handle filenames containing non-ANSI-1252 characters.
local function u8toansi(s)
    local r = ''
    for _, c in utf8.codes(s) do
        if c < 128 then
            r = r .. string.char(c)
        else
            local conv = CodepointToAnsiMap[c]
            if conv == nil then
                if c>255 then error("Non-ANSI 1252 codepoint " .. conv .. " in utf8 to ansi conversion") end
                conv = c
            end
            r = r .. string.char(conv)
        end
    end
    return r
end

-- local filename_u8 = 'pré.txt'
-- local filename_ansi = u8toansi(filename_u8)
-- local f = assert(io.open(filename_ansi, "r"))

local filename = u8toansi([[Data utf-8\prénoms-utf8.txt]])
local n = 5

local f = assert(io.open(filename, "r"))
for line in f:lines() do
    print(line)
    n = n - 1
    if n == 0 then break end
end
f:close()

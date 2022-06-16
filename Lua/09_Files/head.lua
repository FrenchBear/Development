-- head.lua
-- Play with files in Lua, print the first n lines of a file
--
-- 2022-06-16   PV

-- Support for UTF8 -> ANSI 1252 conversions
require 'u8a'

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- local filename_u8 = 'pré.txt'
-- local filename_ansi = u8toansi(filename_u8)
-- local f = assert(io.open(filename_ansi, "r"))

local filename = Utf8toAnsi1252([[Data utf-8\prénoms-utf8.txt]])
local n = 5

local f = assert(io.open(filename, "r"))
for line in f:lines() do
    print(line)
    n = n - 1
    if n == 0 then break end
end
f:close()

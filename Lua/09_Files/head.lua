-- head.lua
-- Play with files in Lua, print the first n lines of a file
--
-- 2022-06-16   PV

-- Support for UTF8 -> ANSI 1252 conversions
require 'u8a'

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


-- local filename = Utf8toAnsi1252([[C:\Development\TestFiles\Text\prénoms-utf8.txt]])
local filename = [[C:\Development\TestFiles\Text\prénoms-utf8.txt]]
local n = 5

local f = assert(io.open(filename, "r"))
for line in f:lines() do
    print(line)
    n = n - 1
    if n == 0 then break end
end
f:close()

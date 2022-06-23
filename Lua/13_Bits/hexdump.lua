-- hexdump.lua
-- Hexadecimal dump of a file
-- Où ça? Là!
--
-- 2022-06-23   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local file = arg[1] or 'hexdump.lua'
local f = assert(io.open(file, "rb"))
local blocksize = 16
local pos = 0
for block in f:lines(blocksize) do
    io.write(string.format("%06X: ", pos))
    for i = 1, #block do
        local b = string.byte(block, i)
        io.write(string.format("%02X ", b))
    end
    io.write(string.rep("   ", blocksize - #block) .. " ")
    print((string.gsub(block, "%c", ".")))
    pos = pos + blocksize
end
f:close()

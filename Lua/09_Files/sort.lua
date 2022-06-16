-- sort.lua
-- Play with files in Lua, sort infile or stdin, write result to outfile or stdout
-- Exercise 7.1 and 7.2
--
-- 2022-06-16   PV

-- Support for UTF8 -> ANSI 1252 conversions
require 'u8a'
require 'common_fs'

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local infile = Utf8toAnsi1252([[ZData utf-8\prénoms-utf8.txt]])
local outfile = Utf8toAnsi1252([[C:\temp\prénoms-utf8-triés.txt]])
-- local infile = nil
-- local outfile = nil

if infile ~= nil and not File_Exists(infile) then error("Can't find or read file " .. infile) end

-- if infile is nil, read from stdin
-- if outfile is nil, write to stdout

local stdin_bak = io.input()
local lines = {}
if infile ~= nil then io.input(infile) end
for line in io.lines() do
    lines[#lines + 1] = line
end
if infile ~= nil then
    io.input():close() -- close current stream
    io.input(stdin_bak)
end

table.sort(lines)
local stdout_bak = io.output()
if outfile ~= nil then io.output(outfile) end
for _, l in ipairs(lines) do
    io.write(l, "\n")
end
if outfile ~= nil then
    io.output():close()
    io.output(stdout_bak)
end

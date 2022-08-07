-- arg1.lua
-- Learning lua, decode arg options, first version
-- Start with completely manual code, mays switch to a getopt function later
--
-- 2022-06-17   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

-- Simulation, overrides arg for this example
local arg = {}
arg[0] = "script name"
arg[1] = "-r"
arg[2] = "15"
arg[3] = "-v"
arg[4] = "file1"
arg[5] = "file2"

local rows = nil
local cols = nil
local verbose = false
local files = {}

-- Use a while and not a for since we may increase loop variable inside the loop
local i = 1
while i <= #arg do
    local a = arg[i]:lower()
    if i == 1 and a == "?" then a = "-?" end
    if string.sub(a, 1, 1) == "-" then
        if a == "-r" then
            i = i + 1
            rows = tonumber(arg[i])
            if rows == nil or rows < 5 or rows > 200 then
                error("Invalid option -r value " .. arg[i] .. ", must be an integer between 5 and 200")
            end
        elseif a == "-c" then
            i = i + 1
            cols = tonumber(arg[i])
            if cols == nil or cols < 5 or cols > 200 then
                error("Invalid option -c value " .. arg[i] .. ", must be an integer between 5 and 200")
            end
        elseif a == "-v" then
            verbose = true
        elseif a == "-?" then
            print([[Generation of a random labyrinth, and optionally show solution path (Lua version)
Usage: script [-r rows] [-c cols] [-v] file...
-h           Shows this message
-a           Simple print (ASCII only)
-b a|s|b|d|r Border style, a=ASCII, s=Simple, b=Bold, d=Double, r=Rounded (use chcp 65001 for styles s/b/d/r on Windows)
-s           Shows solution
-m           Monochrome (no color) solution output
-d           Shuffle random generator
-r rows      Number of rows in [5..200]
-c cols      Number of columns in [5..200] ]])
            return
        else
            error("Invalid/unsupported option " .. arg[i])
        end
    else
        -- Non-option arguments
        files[#files + 1] = arg[i] -- preserve case
    end
    i = i + 1
end

print("rows", rows)
print("cols", cols)
print("verbose", verbose)
print("files", table.concat(files, ", "))

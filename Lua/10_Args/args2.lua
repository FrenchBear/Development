-- arg2.lua
-- Learning lua, decode arg options, second version
-- With isOption and getOptValue
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
local ixarg = 1 -- index of current argument
local currarg -- current argument

local isOption = function(opt)
    -- chr(45) = '-', chr(47) = '/'
    return (string.byte(currarg, 1) == 45 or string.byte(currarg, 1) == 47) and currarg:lower():sub(2) == opt
end

local getOptValue = function()
    if ixarg == #arg then error("Option " .. currarg .. " requires an argument") end
    ixarg = ixarg + 1
    return arg[ixarg]
end

while ixarg <= #arg do
    currarg = arg[ixarg]

    if isOption("r") then
        rows = tonumber(getOptValue())
        if rows == nil or rows < 5 or rows > 200 then
            error("Invalid option -r value " .. arg[ixarg] .. ", must be an integer between 5 and 200")
        end
    elseif isOption("c") then
        cols = tonumber(getOptValue())
        if cols == nil or cols < 5 or cols > 200 then
            error("Invalid option -c value " .. arg[ixarg] .. ", must be an integer between 5 and 200")
        end
    elseif isOption("v") then
        verbose = true
    elseif currarg == "?" or isOption("?") or isOption("help") then
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
    else -- Other arguments
        -- chr(45) = '-', chr(47) = '/'
        if string.byte(currarg, 1) == 45 or string.byte(currarg, 1) == 47 then
            error("Unknown/unsupporter option " .. currarg)
        end
        -- Non-option arguments
        files[#files + 1] = arg[ixarg] -- preserve case
    end
    ixarg = ixarg + 1
end

print("rows", rows)
print("cols", cols)
print("verbose", verbose)
print("files", table.concat(files, ", "))

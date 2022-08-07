-- args.lua
-- Play with command line arguments in lua
-- From https://docs.novatel.com/OEM7/Content/Lua/PassingArgumentsLua.htm?TocPath=Configurations%7CNovAtel%20API%7CLoading%20and%20Running%20the%20Application%7CRunning%20the%20Application%7C_____4
--
-- Use Shift+Ctrl+R to start task "Lua current file with 4 arguments" rather than Debug
-- 2022-06-06   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

-- Print the script name
print(string.format('Script Name: "%s"', arg[0]))

print("arg length: " .. #arg)

FormatString = '%-10s%-10s%-15s%-15s'
print(string.format(FormatString, 'Arg#', 'Type', 'String', 'Number'))

-- Iterate through the arguments
Sum = 0
NumberOfTwenties = 0
for i = 1, 4 do
    -- Print some information about the argument
    -- NOTE: The type of these arguments is always "string"
    print(string.format(FormatString, i, type(arg[i]), arg[i], tonumber(arg[i])))

    -- Check if the string represents a number
    if (tonumber(arg[i]) ~= nil) then
        -- If the string represents a number, Lua will automatically
        -- convert the string to a number for arithmetic
        Sum = Sum + arg[i]
    end

    -- Since the arg values are always of type "string"
    -- a direct comparison with a number will always fail
    if (arg[i] == 20) then
        NumberOfTwenties = NumberOfTwenties + 1
    end
end

print('')
print(string.format("Sum of Number Arguments: %d", Sum))
print(string.format("Number of 20s found: %d", NumberOfTwenties))

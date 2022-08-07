-- test_close.lua
-- Learning Lua, <close> attribute of Lua 5.4
--
-- 2022-07-13   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

do
    local mytable = { i = 3 }   -- Can't put <close> here: Error: variable 'mytable' got a non-closable value
    setmetatable(mytable, { __close = function() print('mytable.__close called') end })
    local mytable_closable <close> = mytable
    print('About to end local bloc')
end
print('After local bloc')

local function new_thing()
    local thing = {}
    setmetatable(thing, { __close = function() print('new_thing.__close called') end })
    return thing
end

do
    local x <close> = new_thing()
    print('Use thing')
end

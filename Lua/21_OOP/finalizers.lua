-- test_close.lua
-- Learning Lua, play with finalizers
--
-- 2022-07-13   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local o = {x = "hi"}
setmetatable(o, {__gc = function (z) print(z.x) end})
o = nil
collectgarbage() --> hi

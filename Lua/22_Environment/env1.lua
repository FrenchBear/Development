-- env1.lua
-- Learning Lua, play with environment
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local print, sin, _G = print, math.sin, _G
_ENV = nil
print(13) --> 13
print(sin(13)) --> 0.42016703682664
--print(math.cos(13)) -- error!
print(_G.math.cos(13))

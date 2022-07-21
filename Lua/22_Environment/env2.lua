-- env2.lua
-- Learning Lua, play with environment
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

_ENV = { _G = _G }
local function foo()
    _G.print(a) -- compiled as '_ENV._G.print(_ENV.a)'
end

a = 10
foo() --> 10
_ENV = { _G = _G, a = 20 }
foo() --> 20

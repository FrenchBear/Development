-- coroutines.lua
-- Learning Lua, play with reflection, introspection functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")


-- All introspective functions from the debug library accept an optional coroutine as their first argument, so
-- that we can inspect the coroutine from the outside.

local co = coroutine.create(function()
    local x = 10
    coroutine.yield()
    error("some error")
end)

coroutine.resume(co)
print(debug.traceback(co))
print(debug.getlocal(co, 1, 1)) --> x 10

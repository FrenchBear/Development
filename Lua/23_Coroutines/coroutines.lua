-- coroutines.lua
-- Learning Lua, play with coroutines
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local co = coroutine.create(function() print("hi") end)

print(type(co)) --> thread

-- A coroutine can be in one of four states: suspended, running, normal, and dead
-- When we create a coroutine, it starts in the suspended state; a coroutine does
-- not run its body automatically when we create it.
print(coroutine.status(co)) --> suspended

-- The function coroutine.resume (re)starts the execution of a coroutine,
-- changing its state from suspended to running:
coroutine.resume(co) --> hi

print(coroutine.status(co)) --> dead



-- The real power of coroutines stems from the function yield, which allows
-- a running coroutine to suspend its own execution so that it can be resumed later.
co = coroutine.create(function()
    for i = 1, 3 do
        print("co", i)
        coroutine.yield()
    end
end)
coroutine.resume(co) --> co 1
print(coroutine.status(co)) --> suspended
coroutine.resume(co) --> co 2
coroutine.resume(co) --> co 3
print(coroutine.status(co)) --> suspended
coroutine.resume(co) --> nothing
print(coroutine.status(co)) --> dead
print(coroutine.resume(co)) --> false   cannot resume dead coroutine (resume runs in protected mode, like pcall)
print()


-- Passing arguments in the first resume
co = coroutine.create(function(a, b, c)
    print("co", a, b, c + 2)
end)
coroutine.resume(co, 1, 2, 3) --> co 1 2 5
print()


-- A call to coroutine.resume returns, after the true that signals no errors, any arguments passed to the corresponding yield:
co = coroutine.create(function(a, b)
    coroutine.yield(a + b, a - b)
end)
print(coroutine.resume(co, 20, 10)) --> true 30 10
print()

-- Symmetrically, coroutine.yield returns any extra arguments passed to the corresponding resume
co = coroutine.create(function(x)
    print("co1", x)
    print("co2", coroutine.yield())
end)
coroutine.resume(co, "hi") --> co1 hi
coroutine.resume(co, 4, 5) --> co2 4 5
print()


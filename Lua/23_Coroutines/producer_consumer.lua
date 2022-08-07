-- producer_caller.lua
-- Learning Lua, play with coroutines, clean implementation pattern
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

-- returns next value, returned by coroutine.resume
local function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end

local function send(x)
    coroutine.yield(x)
end

local function producer()
    return coroutine.create(function()
        while true do
            local x = io.read() -- produce new value
            send(x)
        end
    end)
end

-- Filter sits between the producer and the consumer, doing some kind of transformation in the data.
-- A filter is a consumer and a producer at the same time, so it resumes a producer to get new values 
-- and yields the transformed values to a consumer. 
-- As a trivial example, this filter inserts a line number at the beginning of each line.
local function filter(prod)
    return coroutine.create(function()
        for line = 1, math.huge do
            local x = receive(prod) -- get new value
            x = string.format("%5d %s", line, x)
            send(x) -- send it to consumer
        end
    end)
end

local function consumer(prod)
    while true do
        local x = receive(prod) -- get new value
        io.write(x, "\n") -- consume new value
    end
end

consumer(filter(producer()))

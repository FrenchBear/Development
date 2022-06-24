-- queue.lua
-- Learning lua, classical structures
-- Implementation of a simple queue
-- Do not use table.insert/table.remove but head/tail indexes for better performance
--
-- 2022-06-23   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

Queue = {

    __classname = "Queue", -- non standard!

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        object.tb = {}
        object.head = 0
        object.tail = 1

        return object
    end,

    enqueue = function(self, value)
        self.head = self.head + 1
        self.tb[self.head] = value
    end,

    dequeue = function(self)
        if self.tail > self.head then error("Empty queue") end
        local res = self.tb[self.tail]
        self.tail = self.tail + 1
        return res
    end,

    count = function(self)
        return self.head-self.tail+1
    end,

    __tostring = function(self)
        return "Queue [" .. table.concat(self.tb, ", ") .. "]"
    end
}

-- Test
local q = Queue:new()
q:enqueue("vert")
q:enqueue("orange")
q:enqueue("rouge")
print(q)
print("Count", q:count())
while q:count() > 0 do
    print(q:dequeue())
end

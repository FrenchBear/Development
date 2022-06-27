-- queue.lua
-- Learning lua, classical structures
-- Implementation of a simple queue
-- Do not use table.insert/table.remove but head/tail indexes for better performance
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

Queue = {
    __name = "Queue", -- non standard!

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        self:clear()
        -- object.tb = {}
        -- object.head = 0
        -- object.tail = 1

        return object
    end,

    enqueue = function(self, value)
        self.head = self.head + 1
        self.tb[self.head] = value
    end,

    enqueueRange = function(self, values)
        for _, v in ipairs(values) do
            self.head = self.head + 1
            self.tb[self.head] = v
        end
    end,

    dequeue = function(self)
        if self.tail > self.head then error("Empty queue") end
        local res = self.tb[self.tail]
        self.tail = self.tail + 1
        return res
    end,

    clear = function(self)
        self.tb = {}
        self.head = 0
        self.tail = 1
    end,

    __tostring = function(self)
        return self.__name .. " [" .. table.concat(self.tb, ", ") .. "]"
    end,

    __len = function(self)
        return self.head - self.tail + 1
    end
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    local q = Queue:new()
    q:enqueue("vert")
    q:enqueue("orange")
    q:enqueue("rouge")
    print(q)
    print("Count", #q)
    while #q > 0 do
        print(q:dequeue())
    end
    print()

    q:clear()
    q:enqueueRange({ "one", "two", "three", "four", "five" })
    print(q)
    print("Count", #q)
    while #q > 0 do
        print(q:dequeue())
    end
    print()
end

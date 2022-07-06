-- deque.lua
-- Learning lua, classical structures
-- Implementation of a deque as a module
--
-- 2022-07-04   PV
-- 2022-07-06   PV      Stateless iterator
Deque = {
    __name = "Deque",

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        self:clear()

        return object
    end,

    clear = function(self)
        self.first = 0
        self.last = -1
        self.list = {}
    end,

    pushFirst = function(self, value)
        self.first = self.first - 1
        self.list[self.first] = value
    end,

    pushLast = function(self, value)
        self.last = self.last + 1
        self.list[self.last] = value
    end,

    popFirst = function(self)
        if self.first > self.last then error("list is empty") end
        local value = self.list[self.first]
        self.list[self.first] = nil -- to allow garbage collection
        self.first = self.first + 1
        return value
    end,

    popLast = function(self)
        if self.first > self.last then error("list is empty") end
        local value = self.list[self.last]
        self.list[self.last] = nil -- to allow garbage collection
        self.last = self.last - 1
        return value
    end,

    -- Stateless iterator, returns queue elements from oldest (next to be dequed) to the last inserted
    __pairs = function(self)
        return function (t, i)
            i=i+1
            local v = t[i]
            if v then return i, v end
        end, self.list, self.first-1
    end,

    __tostring = function(self)
        local t = {}
        for i = self.first, self.last do
            t[#t + 1] = string.format("%q", self.list[i])
        end
        return self.__name .. " [" .. table.concat(t, ", ") .. "]"
    end,

    __len = function(self)
        return self.last - self.first + 1
    end,
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    os.execute("chcp 65001 >NUL")

    local d = Deque:new()
    d:pushFirst(1)
    d:pushFirst(2)
    d:pushFirst(3)
    d:pushLast('A')
    d:pushLast('B')
    d:pushLast('C')

    print(d, "len = " .. #d)
    print("d:popFirst()", d:popFirst())
    print("d:popLast()", d:popLast())
    print(d, "len = " .. #d)
    print()

    -- Test Stateless iterator
    for k, v in pairs(d) do
        print(k, v)
    end
end

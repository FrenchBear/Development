-- stack.lua
-- Learning lua, classical structures
-- Implementation of a stack
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname
-- 2022-07-05   PV      Stateless iterator

Stack = {
    __name = "Stack", -- non standard!

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        object.tb = {}

        return object
    end,

    push = function(self, value)
        self.tb[#(self.tb) + 1] = value
    end,

    pushRange = function(self, values)
        for _, v in ipairs(values) do
            self.tb[#(self.tb) + 1] = v
        end
    end,

    pop = function(self)
        if #self.tb == 0 then error("Empty stack") end
        local res = self.tb[#self.tb]
        self.tb[#self.tb] = nil
        return res
    end,

    top = function(self)
        if #self.tb == 0 then error("Empty stack") end
        return self.tb[#self.tb]
    end,

    peek = function(self)
        if #self.tb == 0 then error("Empty stack") end
        local res = self.tb[#self.tb]
        return res
    end,

    clear = function(self)
        self.tb = {}
    end,

    -- Stateless iterator, returns stack elements from oldest to the one on top
    __pairs = function(self)
        return function (t, i)
            i=i+1
            local v = t[i]
            if v then return i, v end
        end, self.tb, 0
    end,

    __tostring = function(self)
        return self.__name .. " [" .. table.concat(self.tb, ", ") .. "]"
    end,

    __len = function(self)
        return #self.tb
    end,
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

    local s = Stack:new()
    s:push("vert")
    s:push("orange")
    s:push("rouge")
    print(s)
    print("Count", #s)
    print("Top", s:top())
    while #s > 0 do
        print(s:pop())
    end
    print()

    s:clear()
    s:pushRange({ "one", "two", "three", "four", "five" })
    print(s)
    print("Count", #s)
    while #s > 0 do
        print(s:pop())
    end
    print()

    -- Test Stateless iterator
    s:clear()
    s:pushRange({ "pomme", "poire", "ananas", "scoubidou", "bidoubidou" })
    s:pop() -- Remove an element
    for k, v in pairs(s) do
        print(k, v)
    end
end

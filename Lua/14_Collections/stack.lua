-- stack.lua
-- Learning lua, classical structures
-- Implementation of a stack
--
-- 2022-06-23   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

Stack = {
    __classname = "Stack", -- non standard!

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

    peek = function(self)
        if #self.tb == 0 then error("Empty stack") end
        local res = self.tb[#self.tb]
        return res
    end,

    count = function(self)
        return #self.tb
    end,

    clear = function(self)
        self.tb = {}
    end,

    __tostring = function(self)
        return "Stack ["..table.concat(self.tb, ", ").."]"
    end
}

-- Test
local s = Stack:new()
s:push("vert")
s:push("orange")
s:push("rouge")
print(s)
print("Count", s:count())
while s:count()>0 do
    print(s:pop())
end
print()

s:clear()
s:pushRange({"one", "two", "three", "four", "five"})
print(s)
print("Count", s:count())
while s:count()>0 do
    print(s:pop())
end
print()

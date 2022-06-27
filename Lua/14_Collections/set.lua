-- set.lua
-- Learning lua, classical structures
-- Implementation of a set mith minimal operations (inter, union)
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

Set = {
    __name = "Set", -- non standard!

    new = function(self, object, initlist)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        object:clear()
        if initlist then object:addRange(initlist) end

        return object
    end,

    add = function(self, value)
        if self.tb[value] == nil then
            self.tb[value] = true
            self.nb = self.nb + 1
        end
    end,

    remove = function(self, value)
        if self.tb[value] ~= nil then
            self.tb[value] = nil
            self.nb = self.nb - 1
        end
    end,

    addRange = function(self, values)
        for _, v in pairs(values) do
            if self.tb[v] == nil then
                self.tb[v] = true
                self.nb = self.nb + 1
            end
        end
    end,

    contains = function(self, value)
        return self.tb[value] == true
    end,

    items = function(self)
        return pairs(self.tb)
    end,

    clear = function(self)
        self.tb = {}
        self.nb = 0
    end,

    union = function(self, other)
        local res = Set:new()
        for k in pairs(self.tb) do res:add(k) end
        for k in pairs(other.tb) do res:add(k) end
        return res
    end,

    inter = function(self, other)
        local res = Set:new()
        for k in pairs(self.tb) do
            if other:contains(k) then
                res:add(k)
            end
        end
        return res
    end,

    __tostring = function(self)
        local t = { self.__name .. " [" }
        for k in pairs(self.tb) do
            if #t > 1 then t[#t + 1] = ", " end
            t[#t + 1] = k
        end
        t[#t + 1] = "]"
        return table.concat(t)
    end,

    __len = function(self)
        return self.nb
    end
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    local s = Set:new()
    s:addRange({ "c", "l", "a", "s", "s", "e" })
    print(s)
    print("Count", #s)
    for v in s:items() do
        print(v)
    end
    print()

    s:clear()
    for i = 1, 10 do
        s:add(math.random(1, 6))
    end
    print(s)
    print()

    local s2 = Set:new(nil, { 0, 2, 4, 6, 8, 10, 12 })
    local s3 = Set:new(nil, { 0, 3, 6, 9, 12 })
    print("s2", s2)
    print("s3", s3)
    local su = s2:union(s3)
    print("s2∪s3", su)
    local si = s2:inter(s3)
    print("s2∩s3", si)
end

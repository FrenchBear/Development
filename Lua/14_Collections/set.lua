-- set.lua
-- Learning lua, classical structures
-- Implementation of a set mith minimal operations (inter, union)
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname
-- 2022-06-30   PV      Simpler version of __tostring
-- 2022-07-05   PV      __add/__mul for union/inter, __le/__lt/__eq for seubser/proper subset/equality

Set = {
    __name = "Set",

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
            -- if other:contains(k) then
            --     res:add(k)
            -- end
            res.tb[k] = other.tb[k] -- Much simpler!
        end
        return res
    end,

    -- Simpler version
    __tostring = function(self)
        local t = {}
        for k in pairs(self.tb) do t[#t + 1] = k end
        return self.__name .. " {" .. table.concat(t, ", ") .. "}"
    end,

    __len = function(self)
        return self.nb
    end
}

-- Define operator + to do the union and * to do the intersection
Set.__add = Set.union
Set.__mul = Set.inter

-- Subset, operator <= (and >= with reversed arguments)
Set.__le = function(a, b)
    for k in pairs(a.tb) do
        if not b.tb[k] then return false end
    end
    return true
end

-- Proper subset, operator < (and > with reversed arguments)
Set.__lt = function(a, b)
    return a <= b and not (b <= a)
end

-- Set equality, operator == (and ~= returning not ==)
Set.__eq = function(a, b)
    return a <= b and b <= a
end


-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    os.execute("chcp 65001 >NUL")

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
    print("A", s2)
    print("B", s3)
    local su = s2:union(s3)
    print("A ∪ B", su)
    local si = s2:inter(s3)
    print("A ∩ B", si)

    print()
    print("A+B", s2 + s3)
    print("(A+B)*B", (s2 + s3) * s2)
    print()

    local sa = Set:new(nil, { 2, 4 })
    local sb = Set:new(nil, { 4, 10, 2 })
    print("sa", sa)
    print("sb", sb)
    print("sa<=sb ⊆", sa <= sb) --> true
    print("sa<sb  ⊂", sa < sb) --> true
    print("sa>=sa ⊇", sa >= sa) --> true
    print("sa>sb  ⊃", sa > sb) --> false
    print("sa==sb =", sa == sb * sa) --> true
end

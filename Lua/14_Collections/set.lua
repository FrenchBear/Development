-- set.lua
-- Learning lua, classical structures
-- Implementation of a set with minimal operations (inter, union)
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname
-- 2022-06-30   PV      Simpler version of __tostring
-- 2022-07-05   PV      __add/__mul for union/inter, __le/__lt/__eq for subset/proper subset/equality
-- 2022-07-11   PV      Set difference; __pairs iterator

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
            res.tb[k] = other.tb[k]
        end
        return res
    end,

    minus = function(self, other)
        local res = Set:new()
        for k in pairs(self.tb) do
            if other.tb[k] == nil then
                res.tb[k] = true
            end
        end
        return res
    end,

    -- Simpler version
    __tostring = function(self)
        local t = {}
        for k in pairs(self.tb) do t[#t + 1] = string.format("%q", k) end
        return self.__name .. " {" .. table.concat(t, ", ") .. "}"
    end,

    __len = function(self)
        return self.nb
    end,

    __pairs = function(self)
        return function(_, k) -- iteration function
            return next(self.tb, k)
        end
    end,

    -- Iterator returning all subsets of a set.
    -- Beware it will return 2^len(self) elements!
    -- Exercise (exercise 18.5)
    allSubsets = function(self)
        local i = math.tointeger(2 ^ self.nb)
        local items = {}
        for item in pairs(self.tb) do
            items[#items + 1] = item
        end
        return function()
            i = i - 1
            if i < 0 then return nil end
            local s = Set:new()
            local i2 = i
            for j = 1, self.nb do
                if (i2 & 1) == 1 then
                    s:add(items[j])
                end
                i2 = i2 >> 1
            end
            return s
        end
    end,
}

-- Define operator + to do the union and * to do the intersection
Set.__add = Set.union
Set.__mul = Set.inter
Set.__sub = Set.minus

-- Define operator | to do the union and & to do the intersection
Set.__bor = Set.union
Set.__band = Set.inter

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
    print("A ∖ B", s2:minus(s3))
    print()

    print("A+B", s2 + s3)
    print("(A+B)*B", (s2 + s3) * s2)
    print("A-B", s2 - s3)
    print()

    print("A|B", s2 | s3)
    print("(A|B)&B", (s2 | s3) & s2)
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
    print()

    local tss = Set:new(nil, { 1, 2, 3, 4 })
    print("subsets of " .. tostring(tss))
    for ss in tss:allSubsets() do
        print(ss)
    end
    print()

    local sc = Set:new(nil, { 'C', 'l', 'a', 's', 's', 'e' })
    print("Iterate over letters of Classe")
    for k in pairs(sc) do
        print(k)
    end
end

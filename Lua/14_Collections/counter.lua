-- counter.lua
-- Learning lua, classical structures
-- Implementation of a simple Counter class
--
-- -ToDo: Add an indexer to retrieve count using xx[value] instead of count(value) function, and a setter indexer to force count
--
-- 2022-06-30   PV

require "quote_key"

Counter = {
    __name = "Counter",

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        self:clear()

        return object
    end,

    add = function(self, value, count)
        count = count or 1
        if self.table[value] == nil then
            self.table[value] = count
            self.nb = self.nb + 1
        else
            self.table[value] = self.table[value] + count
            if self.table[value] == 0 then
                self.table[value] = nil
                self.nb = self.nb - 1
            end
        end
        return self.table[value]
    end,

    remove = function(self, value, count)
        self:add(value, -(count or 1))
    end,

    count = function(self, value)
        return self.table[value]
    end,

    pairs = function(self)
        return pairs(self.table)
    end,

    clear = function(self)
        self.table = {}
        self.nb = 0
    end,

    __tostring = function(self)
        local t = {}
        for k, v in pairs(self.table) do
            t[#t + 1] = QuoteKey(k) .. string.format("=%q", v)
        end
        return self.__name .. " [" .. table.concat(t, ", ") .. "]"
    end,

    __len = function(self)
        return self.nb
    end,

    -- Simple iterator
    __pairs = function(self)
        local keys = {}
        for k in pairs(self.table) do
            keys[#keys + 1] = k
        end
        local ix = 0
        return function()
            ix = ix + 1
            if ix > #keys then
                return nil, nil
            else
                return keys[ix], self.table[ keys[ix] ]
            end
        end
    end,

    -- build a table of keys sorted by count (highest first)
    -- returns a function returning a new pair key, count in decreasing count order, ending by nil, nil
    mostCommonIterator = function(self, max)
        max = max or math.huge
        local keys = {}
        for k in pairs(self.table) do
            keys[#keys + 1] = k
        end
        table.sort(keys, function(k1, k2) return self.table[k1] > self.table[k2] end)
        local ix = 0
        return function()
            ix = ix + 1
            if ix > #keys or ix > max then
                return nil, nil
            else
                return keys[ix], self.table[ keys[ix] ]
            end
        end
    end
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    os.execute("chcp 65001 >NUL")

    local c = Counter:new()
    --print("c.z =", c.z)

    local s = "anticonstitutionnellement!!"
    for i = 1, #s do
        c:add(s:sub(i, i))
    end
    print(c, "len = " .. #c)
    print("c.count('t') = " .. c:count("t"))
    print()

    print("Top 5 frequencies:")
    for k, v in c:mostCommonIterator(5) do
        print(QuoteKey(k) .. " = " .. v)
    end
    print()

    c:clear()
    c:add('Pomme')
    c:add('Poire', 2)
    c:add('Ananas', 3)
    c:add('Pomme')
    c:add('Poire', -2)
    for k, v in pairs(c) do
        print(k, v)
    end
end

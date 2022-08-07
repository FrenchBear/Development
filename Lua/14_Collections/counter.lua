-- counter.lua
-- Learning lua, classical structures
-- Implementation of a simple Counter class
--
-- 2022-06-30   PV
-- 2022-07-11   PV      Indexed access finally done, both getter and setter
-- 2022-07-14   PV      More efficient __newindex, not testing special keys

require "quote_key"

Counter = {
    __name = "Counter",

    new = function(self, object)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        self:clear()

        -- Add a proxy layer to support direct indexing
        -- Functions __xxx do not fallback to metatable, so need a manual fallback
        local proxy = {}
        local mt = {
            __index = function(z, k)
                return object[k] or z.__table[k]
            end,

            -- Need to identify special keys that should not be stored in __table
            __newindex = function(z, k, v)
                -- if k == "__tostring" or k == "__len" or k == "__pairs" or k == "__table" or k == "__nb" then
                --     rawset(z, k, v)
                -- else
                --     z.__table[k] = v
                -- end
                if type(k)=="number" and math.type(k)=="integer" then
                    z.__table[k] = v
                else
                    rawset(z, k, v)
                end
            end,

            __tostring = object.__tostring,

            __len = object.__len,

            __pairs = function(inv)
                --return function(z, k) return next(z, k) end, inv.__table
                return next, inv.__table
            end
        }
        setmetatable(proxy, mt)

        return proxy
    end,

    add = function(self, value, count)
        count = count or 1
        if self.__table[value] == nil then
            self.__table[value] = count
            self.__nb = self.__nb + 1
        else
            self.__table[value] = self.__table[value] + count
            if self.__table[value] == 0 then
                self.__table[value] = nil
                self.__nb = self.__nb - 1
            end
        end
        return self.__table[value]
    end,

    remove = function(self, value, count)
        self:add(value, -(count or 1))
    end,

    count = function(self, value)
        return self.__table[value]
    end,

    pairs = function(self)
        return pairs(self.__table)
    end,

    clear = function(self)
        self.__table = {}
        self.__nb = 0
    end,

    __tostring = function(self)
        local t = {}
        for k, v in pairs(self.__table) do
            t[#t + 1] = QuoteKey(k) .. string.format("=%q", v)
        end
        return self.__name .. " [" .. table.concat(t, ", ") .. "]"
    end,

    __len = function(self)
        return self.__nb
    end,

    -- Simple iterator
    __pairs = function(self)
        local keys = {}
        for k in pairs(self.__table) do
            keys[#keys + 1] = k
        end
        local ix = 0
        return function()
            ix = ix + 1
            if ix > #keys then
                return nil, nil
            else
                return keys[ix], self.__table[keys[ix]]
            end
        end
    end,

    -- build a table of keys sorted by count (highest first)
    -- returns a function returning a new pair key, count in decreasing count order, ending by nil, nil
    mostCommonIterator = function(self, max)
        max = max or math.huge
        local keys = {}
        for k in pairs(self.__table) do
            keys[#keys + 1] = k
        end
        table.sort(keys, function(k1, k2) return self.__table[k1] > self.__table[k2] end)
        local ix = 0
        return function()
            ix = ix + 1
            if ix > #keys or ix > max then
                return nil, nil
            else
                return keys[ix], self.__table[keys[ix]]
            end
        end
    end,

    item = function(self, key)
        return self.__table[key]
    end,
}


-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

    local c = Counter:new()

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
    print("---")

    c:clear()
    c:add('Pomme')
    c:add('Poire', 2)
    c:add('Ananas', 3)
    c:add('Pomme')
    c:add('Poire', -2)
    for k, v in pairs(c) do
        print(k, v)
    end
    print("---")

    print(c)
    local p = c:item('Pomme')
    print("Pomme = " .. p)
    local a = c['Ananas']
    print("Ananas = " .. a)
    c.Ananas = 7
    print(c)
end

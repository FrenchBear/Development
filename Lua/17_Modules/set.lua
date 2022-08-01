-- set.lua, module version
-- Learning lua, classical structures
-- Implementation of a set with minimal operations (inter, union)
--
-- 2022-06-23   PV
-- 2022-06-27   PV      __len/# instead of count(); __name instead of __classname
-- 2022-06-30   PV      Module version

-- The module version does not defile global table Set anymore, but returns an anonymous table
return {
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
            if other:contains(k) then
                res:add(k)
            end
        end
        return res
    end,

    -- new, simpler version
    __tostring = function(self)
        local t = {}
        for k in pairs(self.tb) do t[#t + 1] = k end
        return self.__name .. " [" .. table.concat(t, ", ") .. "]"
    end,

    __len = function(self)
        return self.nb
    end
}

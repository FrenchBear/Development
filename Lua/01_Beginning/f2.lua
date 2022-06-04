-- Test with metatables
--
-- 2022-06-04   PV

local meta = {}

meta.__add = function(left, right)
    return left.value + right
end

local container = { value = 5 }
setmetatable(container, meta)

print(container+2)

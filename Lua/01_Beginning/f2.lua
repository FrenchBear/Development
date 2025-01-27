-- Test with metatables
--
-- 2022-06-04   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local meta = {}

meta.__add = function(left, right)
    return left.value + right
end

local container = { value = 5 }
setmetatable(container, meta)

print(container+2)

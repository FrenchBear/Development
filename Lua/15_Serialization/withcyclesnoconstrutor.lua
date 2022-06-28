-- withsyclesnoconstructor.lua
-- Learning Lua, playing with serialization
-- This version formats tables that can contain cycles/self-references but doesn't use tables constructors
--
-- 2022-06-28   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local function basicSerialize(o)
    -- assume 'o' is a number or a string
    return string.format("%q", o)
end

local function save(name, value, saved)
    saved = saved or {} -- initial value
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basicSerialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then -- value already saved?
            io.write(saved[value], "\n") -- use its previous name
        else
            saved[value] = name -- save name for next time
            io.write("{}\n") -- create a new table
            for k, v in pairs(value) do -- save its fields
                k = basicSerialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
    end
end

local a = { x = 1, y = 2, ['goto'] = "lost", { 3, 4, 5 } }
a[2] = a -- cycle
a.z = a[1] -- shared subtable
save("a", a)

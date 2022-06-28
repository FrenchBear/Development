-- withcyclesconstructors.lua
-- Learning Lua, playing with serialization
-- This version formats tables that contains loops or recursive references, and uses tables constructors
-- First part is a simple hierarchy of constructors, 2nd part is complement lua code to create loops and self_references
--
-- 2022-06-28   PV      First version

require "quote_key"

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local function serialize_complexe(name, v, off, prefix, res, extra, saved)
    if type(v) == "nil" or type(v) == "number" or type(v) == "string" or type(v) == "boolean" then
        res[#res + 1] = string.format("%s%s = %q,", off, QuoteKey(name), v)
    elseif type(v) == "table" then
        if saved[v] then
            local qk = QuoteKey(name)
            if qk:sub(1, 1) ~= '[' then qk = "." .. qk end
            extra[#extra + 1] = string.format("%s%s = %s", prefix, qk, saved[v])
        else
            local tn = prefix
            local qk = QuoteKey(name)
            if qk:sub(1, 1) == '[' then
                tn = tn .. qk
            else
                tn = (#tn>0 and tn .. "." or tn) .. qk
            end
            saved[v] = tn
            res[#res + 1] = string.format("%s%s = {", off, QuoteKey(name))
            for k, val in pairs(v) do
                serialize_complexe(k, val, off .. "  ", tn, res, extra, saved)
            end
            res[#res + 1] = off .. "}" .. (off == "" and "" or ",")
        end
    else -- "function", "thread", and "userdata"
        error("Don't know how to serialize member " .. name .. " of type " .. type(v))
    end
end

local function do_serialize(name, t)
    local res = {}
    local extra = {}
    serialize_complexe(name, t, "", "", res, extra, {})
    print(table.concat(res, "\n") .. "\n\n" .. table.concat(extra, "\n"))
end

local a = { x = 1, y = 2, ['goto'] = "lost", { 3, 4, 5 } }
a[2] = a -- cycle
a.z = a[1] -- shared subtable
a[1][4] = {}
a[1][4]["self"] = a[1][4]
do_serialize("a", a)


-- local mytable = {
--     [0] = "zero", "one", true, 123, 1.4142136, yes = "oui",
--     subtable = { no = nil, [true] = "vrai", [6] = "six", [1.4142136] = "√2", ["√2"] = 1.4142136,
--         [3.1416] = "π", ["π"] = 3.1416,
--         flag = { country = "France", colors = { "bleu", "blanc", "rouge" }, ['#'] = 3 },
--         green = "vert" },
--     ['goto'] = "somewhere"
-- }
-- do_serialize("ts", mytable)

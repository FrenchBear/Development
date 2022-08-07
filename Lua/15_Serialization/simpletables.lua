-- simpletables.lua
-- Learning Lua, playing with serialization
-- This version only formats tables that do not contains loops or recursive references, and uses tables constructors
--
-- 2022-06-28   PV      First version

require "quote_key"

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local function serialize_simple(name, v, off, res)
    if type(v) == "nil" or type(v) == "number" or type(v) == "string" or type(v) == "boolean" then
        res[#res + 1] = string.format("%s%s = %q,", off, QuoteKey(name), v)
    elseif type(v) == "table" then
        res[#res + 1] = string.format("%s%s = {", off, QuoteKey(name))
        for k, val in pairs(v) do
            serialize_simple(k, val, off .. "  ", res)
        end
        res[#res + 1] = off .. "}" .. (off == "" and "" or ",")
    else -- "function", "thread", and "userdata"
        error("Don't know how to serialize member " .. name .. " of type " .. type(v))
    end
end

local function do_serialize(name, t)
    local res = {}
    serialize_simple(name, t, "", res)
    print(table.concat(res, "\n"))
end

local mytable = {
    [0] = "zero", "one", true, 123, 1.4142136, yes = "oui",
    subtable = { no = nil, [true] = "vrai", ['true']="vrai", [6] = "six", [1.4142136] = "√2", ["√2"] = 1.4142136,
        [3.1416] = "π", ["π"] = 3.1416,
        flag = { country = "France", colors = { "bleu", "blanc", "rouge" }, ['#'] = 3 },
        green = "vert" },
    ['goto'] = "somewhere"
}
do_serialize("ts", mytable)

local ts = {
    [1] = "one",
    [2] = true,
    [3] = 123,
    [4] = 0x1.6a09e7098ef5p+0,
    [0] = "zero",
    ['goto'] = "somewhere",
    yes = "oui",
    subtable = {
        [true] = "vrai",
        ['π'] = 0x1.921ff2e48e8a7p+1,
        [6] = "six",
        [1.4142136] = "√2",
        green = "vert",
        flag = {
            country = "France",
            colors = {
                [1] = "bleu",
                [2] = "blanc",
                [3] = "rouge",
            },
            ['#'] = 3,
        },
        [3.1416] = "π",
        ['√2'] = 0x1.6a09e7098ef5p+0,
    },
}

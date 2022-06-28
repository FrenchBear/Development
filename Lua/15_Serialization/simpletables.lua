-- simpletables.lua
-- Learning Lua, playing with serialization
-- This version only formats tables that do not contains loops or recursive references
--
-- 2022-06-28   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local reserved_words = {
    ['and'] = true,
    ['break'] = true,
    ['do'] = true,
    ['else'] = true,
    ['elseif'] = true,
    ['end'] = true,
    ['false'] = true,
    ['for'] = true,
    ['function'] = true,
    ['goto'] = true,
    ['if'] = true,
    ['in'] = true,
    ['local'] = true,
    ['nil'] = true,
    ['not'] = true,
    ['or'] = true,
    ['repeat'] = true,
    ['return'] = true,
    ['then'] = true,
    ['true'] = true,
    ['until'] = true,
    ['while'] = true,
}

local function quote_key(key)
    if type(key) == "string" then
        local w = key:match("^[%a_][%w_]*$")
        if w then
            return reserved_words[w] == nil and w or "['" .. w .. "']"
        end
        return key
    elseif type(key) == "number" or type(key)=="boolean" then
        return "[" .. tostring(key) .. "]"
    else
        error("Don't know how to represent an index of type " .. type(key))
    end
end

local function serialize_simple(t, off)
    local res = {}
    for k, v in pairs(t) do
        if type(v) == "nil" or type(v) == "number" or type(v) == "string" or type(v) == "boolean" then
            res[#res + 1] = string.format("%s%s = %q,", off, quote_key(k), v)
        elseif type(v) == "table" then
            res[#res + 1] = string.format("%s%s = {", off, quote_key(k))
            -- Use table.copy instead of a loop
            for _, l in ipairs(serialize_simple(v, off .. "  ")) do
                res[#res + 1] = l
            end
            res[#res + 1] = string.format("%s},", off)
        else -- "function", "thread", and "userdata"
            error("Don't know how to serialize member " .. k .. " of type " .. type(v))
        end
    end
    return res
end

local function do_serialize(t)
    print("{\n"..table.concat(serialize_simple(t, ""), "\n").."\n}\n")
end

local mytable = { "one", true, 123, 3.1416, yes = "oui", subtable = {no = nil, [true] = "vrai", [6] = "six", [3.1416] = "π", flag ={ country="France", colors={"bleu","blanc","rouge"}}, green="vert"}, ['goto']="somewhere" }
do_serialize(mytable)

local ts = {
    [1] = "one",
    [2] = true,
    [3] = 123,
    [4] = 0x1.921ff2e48e8a7p+1,
    yes = "oui",
    ['goto'] = "somewhere",
    subtable = {
      flag = {
        country = "France",
        colors = {
          [1] = "bleu",
          [2] = "blanc",
          [3] = "rouge",
        },
      },
      [true] = "vrai",
      [3.1416] = "π",
      [6] = "six",
      green = "vert",
    },
    }

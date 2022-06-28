-- subroutine to generate a correct representation of a key in Lua
-- if it's a number or a bool, returns value between brackets: [2], [2.71818], [true]
-- if it's a string:
--    if it's a valid identifier and not a keyword:
--      return the key as is: green, Country
--    else:
--      return key as a string between brackets: ['goto'], ['false']
--  else raise error
--
-- 2022-06-28   PV

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

function QuoteKey(key)
    if type(key) == "string" then
        local w = key:match("^[%a_][%w_]*$")
        if w and reserved_words[w] == nil then return w end
        return string.format("[%q]", key) -- Not a valid lua identifier or a keyword
    elseif type(key) == "number" or type(key) == "boolean" then
        return "[" .. tostring(key) .. "]"
    else
        error("Don't know how to represent an index of type " .. type(key))
    end
end

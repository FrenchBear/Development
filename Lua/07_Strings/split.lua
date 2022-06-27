-- split.lua
-- Learning lua, most efficient way to split a string
--
-- 2022-06-15   PV


-- String splitter using pattern matching
local function split1(str, separator)
    separator = separator or " "
    local r = {}
    local char_original = separator
    local p1 = 1
    separator = string.gsub(separator, "(%W)", "%%%1")
    for x in string.gmatch(str, "()" .. separator) do
        local pn = tonumber(x)
        r[#r + 1] = string.sub(str, p1, pn - 1)
        p1 = pn + #char_original
    end
    r[#r + 1] = string.sub(str, p1) -- Don't forget last segment
    return r
end

-- More classical version of a string splitter
local function split2(str, separator)
    separator = separator or " "
    local r = {}
    local p1 = 1
    while true do
        local p2 = str:find(separator, p1, true)
        if p2 == nil then
            r[#r + 1] = str:sub(p1)
            return r
        end
        r[#r + 1] = str:sub(p1, p2 - 1)
        p1 = p2 + #separator
    end
end


local function measure_time(fn, name, str)
    local st = os.clock()
    for i=1,10000 do
        for _, w in ipairs(fn(str)) do end
    end
    print(name, "Elapsed", os.clock() - st)
end

-- measure_time(split1, "split1", "Il était une fois")
-- measure_time(split2, "split2", "Il était une fois")

local hp = "Once Harry had refilled his money bag with gold Galleons, silver Sickles, and bronze Knuts from his vault at Gringotts, he had to exercise a lot of self-control not to spend the whole lot at once. He had to keep reminding himself that he had five years to go at Hogwarts, and how it would feel to ask the Dursleys for money for spellbooks, to stop himself from buying a handsome set of solid gold Gobstones (a wizarding game rather like marbles, in which the stones squirt a nasty-smelling liquid into the other player's face when they lose a point). He was sorely tempted, too, by the perfect, moving model of the galaxy in a large glass ball, which would have meant he never had to take another Astronomy lesson. But the thing that tested Harry's resolution most appeared in his favorite shop, Quality Quidditch Supplies, a week after he'd arrived at the Leaky Cauldron."
measure_time(split1, "split1", "Il était une fois")
measure_time(split2, "split2", "Il était une fois")

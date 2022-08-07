-- dynamic_names.lua
-- Learning Lua, control use of names
--
-- 2022-07-21   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

local function getfield(f)
    local v = _G -- start with the table of globals
    for w in string.gmatch(f, "[%a_][%w_]*") do
        v = v[w]
    end
    return v
end

local function setfield(f, v)
    local t = _G -- start with the table of globals
    for w, d in string.gmatch(f, "([%a_][%w_]*)(%.?)") do
        if d == "." then -- not last name?
            t[w] = t[w] or {} -- create table if absent
            t = t[w] -- get the table
        else -- last name
            t[w] = v -- do the assignment
        end
    end
end

setfield("t.x.y", 10)
print(t.x.y) --> 10
print(getfield("t.x.y")) --> 10

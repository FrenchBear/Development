-- dynamic.lua
-- Learning Lua, playing with dynamic loading
-- Generate string repetition functions from srep_1(s) to srep(64-s)
--
-- 2022-06-28   PV      First version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- To test the algorithm
local function stringrep(s, n)
    local r = ""
    while n > 1 do
        if n % 2 == 1 then r = r .. s end
        s = s .. s
        n = n // 2
    end
    return r .. s
end

local function generate_stringrep_n(n)
    local res = { "function stringrep_" .. n .. "(s)" }
    res[#res + 1] = '  local r = ""'
    while n > 1 do
        if n % 2 == 1 then res[#res + 1] = "  r = r .. s" end
        res[#res + 1] = "  s = s .. s"
        n = n // 2
    end
    res[#res + 1] = "  return r..s"
    res[#res + 1] = "end"
    local code = table.concat(res, "\n")
    --print(code)
    load(code)()    -- Execute immediately the creation
end

-- for i = 1, 17 do
--     local r = stringrep("*", i)
--     print(i, #r, r)
-- end

for i=1, 9 do
    generate_stringrep_n(i)
end

local function test(name)
    local s = _G[name]("*")
    print(name, #s, s)
end

test('stringrep_1')
test('stringrep_2')
test('stringrep_3')
test('stringrep_4')
test('stringrep_5')
test('stringrep_6')
test('stringrep_7')
test('stringrep_8')
test('stringrep_9')

-- partint.lua
-- Learning lua, generate all partitions of an integer
--
-- 2022-07-07   PV

local function partint(n)
    local st = {}
    st[1] = { rem = n, l = {} }
    return function()
        while #st > 0 do
            local it = st[#st]
            st[#st] = nil
            if it.rem == 0 then return it.l end
            for i = 1, it.rem do
                local t = { rem = it.rem - i, l = table.move(it.l, 1, #it.l, 1, {}) }
                t.l[#t.l + 1] = i
                st[#st + 1] = t
            end
        end
        return nil
    end
end

local n = 10
local cnt = 0
print("Partitions de " .. n)
for l in partint(n) do
    print(table.concat(l, '+'))
    cnt = cnt + 1
end
assert(cnt == 2 ^ (n - 1))

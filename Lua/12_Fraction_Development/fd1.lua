-- fd1.lua
-- Fraction development #1 in Lua, use a table to memorize remainders and position
--
-- 2022-06-26   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local function toperiod(n, d)
    if d == 0 then
        if n == 0 then return ("0/0 undefined") else return ("/0 error") end
    end
    local sint = ""
    if n < 0 or d < 0 then
        if n * d < 0 then sint = "-" end
        n = math.abs(n)
        d = math.abs(d)
    end
    sint = sint .. tostring(n // d)
    local rem = n % d
    if rem == 0 then return sint end
    local sfrac = ""
    local tf = {}
    while true do
        if rem == 0 then return sint .. "." .. sfrac end

        if tf[rem] ~= nil then
            return sint .. "." .. string.sub(sfrac, 1, tf[rem] - 1) .. "[" .. string.sub(sfrac, tf[rem]) .. "]"
        end

        -- record position for reminder and decimal, and continue to next decimal
        tf[rem] = 1 + #sfrac

        rem = rem * 10
        local q = rem // d
        rem = rem % d

        sfrac = sfrac .. q
    end
end

local function test(n, d, r)
    local x = toperiod(n, d)
    if x == r then print("Ok", n .. "/" .. d .. " = " .. r) else print('KO', n .. "/" .. d ..
            " found " .. x .. ' expected ' .. r)
    end
end

test(100, 250, "0.4")
test(100, 4, "25")
test(8, 2, "4")
test(1, 3, "0.[3]")
test(-1, 3, "-0.[3]")
test(1, -3, "-0.[3]")
test(-1, -3, "0.[3]")
test(1, 5, "0.2")
test(1, 7, "0.[142857]")
test(100, 23, "4.[3478260869565217391304]")
test(679, 550, "1.23[45]")
test(0, 5, "0")
test(5, 0, "/0 error")
test(0, 0, "0/0 undefined")

-- Decimals .[00 01 02 03 ... 96 97 99]
test(1, 9801,
    "0.[000102030405060708091011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969799]")

    local st = os.clock()
for i = 0, 100000 do
    _ = toperiod(100, 23)
end
print("\nElapsed #1", os.clock() - st)

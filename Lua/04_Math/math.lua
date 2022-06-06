-- math.lua
-- Play with math functions in lua
--
-- 2022-06-06   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local function sind(angle_d) return math.sin(math.rad(angle_d)) end

local function cosd(angle_d) return math.cos(math.rad(angle_d)) end

local function tand(angle_d) return math.tan(math.rad(angle_d)) end

local function asind(sine) return math.deg(math.asin(sine)) end

local function acosd(cosine) return math.deg(math.acos(cosine)) end

local function atand(tangent) return math.deg(math.atan(tangent)) end

print(asind(acosd(atand(tand(cosd(sind(9)))))))

print("Pente 10% = " .. math.deg(math.atan(1,10)) .. " degrés")

print("math.pi = " .. math.pi)
print("math.huge = " .. math.huge)                  -- inf
print("math.mininteger = " .. math.mininteger)      -- -2^63
print("math.maxinteger = " .. math.maxinteger)      -- 2^63-1

local t = {n=1, d=3}
print(type(t))

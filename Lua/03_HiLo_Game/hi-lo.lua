-- hi-lo.lua
-- Simple Hi-Lo game in lua
--
-- 2022-06-06   PV

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

-- Seed random generator using number of seconds since a long time ago
math.randomseed(os.time())

local secret = math.random(1,100)

print("A vous de jouer!")
local attempts = 0
while true do
    local guess = tonumber(io.read("n"))
    if guess==0 then 
        print("Ok on arrête, le nombre à trouver était " .. secret)
        break
    end
    attempts = attempts+1
    if guess==secret then
        print("Gagné! Trouvé en " .. attempts .. " essais!")
        break
    end
    if guess>secret then
        print("Trop grand!")
    else
        print("Trop petit")
    end
end

print("C'est terminé.")

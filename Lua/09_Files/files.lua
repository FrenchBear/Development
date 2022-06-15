-- func.lua
-- Play with files in Lua
--
-- 2022-06-16   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local filename = [[Data utf-8\Harry Potter and the Prisoner of Azkaban.txt]]
local f = assert(io.open(filename, "r"))
local hp = f:read("a")
f:close()

--local hp = "Il était un petit navire qui n'avait jamais navigué ohé ohé matelot"

print('Bytes', #hp)
print('chars', utf8.len(hp))

print('Analyse...')
local tf = {}
for i,c in utf8.codes(hp) do
	if tf[c]==nil then
		tf[c]=1
	else
		tf[c]=tf[c]+1
	end
end

-- for key, _ in pairs(tf) do
-- 	print(utf8.char(key), tf[key])
-- end

print('Sort...')
local function getKeysSortedByValue(tbl, sortFunction)
	local keys = {}
	for key in pairs(tbl) do
	  table.insert(keys, key)
	end

	table.sort(keys, function(a, b)
	  return sortFunction(tbl[a], tbl[b])
	end)
	return keys
end

local sortedKeys = getKeysSortedByValue(tf, function(a, b) return a > b end)

print('Top 10 letters')
for i, key in ipairs(sortedKeys) do
	print(utf8.char(key), tf[key])
	if i>10 then break end
end

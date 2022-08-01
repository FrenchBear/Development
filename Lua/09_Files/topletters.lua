-- topletters.lua
-- Play with files in Lua, find the most common letters and pairs
--
-- 2022-06-16   PV
-- 2077-07-21	PV		Use <close> on file variable
-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

local filename = [[Data utf-8\Harry Potter and the Prisoner of Azkaban.txt]]
local hp
do
	local f <close> = assert(io.open(filename, "r"))
	hp = f:read("a")
	--f:close()
end

print('Bytes', #hp)
print('chars', utf8.len(hp))

print('Analyse characters...')
local tc = {} -- Table of characters
local tp = {} -- Table of pairs
local last = nil
for _, c in utf8.codes(hp) do
	tc[c] = (tc[c] or 0) + 1
	if last then
		local pair = (last << 32) + c
		if pair == 16387 then
			local c3 = c + last
		end
		tp[pair] = (tp[pair] or 0) + 1
	end
	last = c
end

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

print('Sort...')
local sortedTcKeys = getKeysSortedByValue(tc, function(a, b) return a > b end)
local sortedTpKeys = getKeysSortedByValue(tp, function(a, b) return a > b end)

print('Top 10 letters')
for i, key in ipairs(sortedTcKeys) do
	print(utf8.char(key), tc[key])
	if i > 10 then break end
end

print('\nTop 10 pairs without a space')
local np = 0
for _, key in ipairs(sortedTpKeys) do
	local c1, c2 = utf8.char(key >> 32), utf8.char(key & 0xFFFFFFFF)
	if c1 ~= ' ' and c2 ~= ' ' then
		print(c1 .. c2, tp[key])
		np = np + 1
		if np > 10 then break end
	end
end

print('\nAnalyse words...')
local tw = {} -- Table of words
for word in string.gmatch(hp, "%w+") do
	tw[word] = (tw[word] or 0) + 1
end
local words = {}
for w in pairs(tw) do -- And not ipairs(tw) !
	words[#words + 1] = w
end
print(#words .. ' words found')
table.sort(words, function(w1, w2) return tw[w1] > tw[w2] or tw[w1] == tw[w2] and w1 < w2 end)
print('\nTop 10 words or 4 letters or more')
local wf = 0
for i = 1, #words do
	if #words[i] >= 4 then
		print(words[i], tw[ words[i] ])
		wf = wf + 1
		if wf >= 10 then break end
	end
end

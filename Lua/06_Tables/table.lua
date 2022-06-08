-- vp.lua
-- Vietnamese puzzle in Lua
-- Solver for a problem published in the Guardian
-- http://www.theguardian.com/science/alexs-adventures-in-numberland/2015/may/20/can-you-do-the-maths-puzzle-for-vietnamese-eight-year-olds-that-has-stumped-parents-and-teachers
-- All you need to do is place the digits from 1 to 9 in the grid and perform calculations that should give a result of 66
--
-- 2022-06-08   PV

-- For VSCode, debug terminal is not utf8 by default
--os.execute("chcp 65001 >NUL")

function TableConcat(t1, t2)
	local t = { table.unpack(t1) }
	for i = 1, #t2 do
		t[#t + 1] = t2[i]
	end
	return t
end

function TableToString(t)
	local s = "{"
	local first = true
	for k, v in pairs(t) do
		if first then first = false else s = s .. ", " end
		s = s .. k .. "=" .. tostring(v)
	end
	s = s .. "}"
	return s
end

L1 = { 1, 2, 3, 4 }
L2 = { 5, 6, 7 }

L3 = TableConcat(L1, L2)
print(TableToString(L3))

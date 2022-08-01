-- table.lua
-- Play with tables in Lua
--
-- 2022-06-08   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

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
print("[" .. table.concat(L3, ', ') .. "]")


-- Exercises 5.4 and 5.5
function CalcPolynom(p, x)
	local r = 0
	for i = 1, #p do
		r = r * x + p[i]
	end
	return r
end

local polynom = { 1, -5, 6 } -- x²-5x+6
print("\nx","x²-5x+6")
for x = 1.0, 4.0, 0.25 do
	print(x, CalcPolynom(polynom, x))
end

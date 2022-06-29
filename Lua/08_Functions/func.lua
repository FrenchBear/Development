-- func.lua
-- Functions in Lua
--
-- 2022-06-10   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

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

-- variadic example
function Add(...)
	local s = 0
	for _, v in ipairs({ ... }) do
		s = s + v
	end
	return s
end

print("5? =", Add(1, 2, 3, 4, 5))

-- Exercise 6.2
function SkipFirst(first, ...)
	return ...
end

print(SkipFirst(1, 2, 3, 4))


-- Exercise 6.3
function SkipLast(...)
	local tmp = { ... }
	tmp[#tmp] = nil
	return table.unpack(tmp)
end

print(SkipLast(1, 2, 3, 4))


-- Exercise 6.4
-- In-place shuffle; returns parameter for convenience (not sure it's a goof idea for in-place shiffling)
function Shuffle(t)
	for i = 1, #t do
		local j = math.random(1, #t)
		t[i], t[j] = t[j], t[i]
	end
	return t
end

local notes = { "do", "ré", "mi", "fa", "sol", "la", "si" }
print(table.concat(Shuffle(notes), ","))


-- Actually useless function, this is just ipairs!!!
local function enumerate(t)
	local ix = 0
	return function()
		if ix >= #t then return end
		ix = ix + 1
		return ix, t[ix]
	end
end

for i, n in enumerate(notes) do
	print(i, n)
end


-- Exercise xx - Generates all combinations of k elements
-- In the stack, fixed indicates the number of elements at the beginning of list that are already combined and part of response
function Combinator(t, k)
	local stack = {}
	local l = #t
	table.insert(stack, { fixed = 0, list = table.move(t, 1, #t, 1, {}) })
	return function()
		if #stack == 0 then return nil end
		while true do
			local tt = table.remove(stack)
			if #tt.list == k or tt.fixed == k then
				return table.move(tt.list, 1, k, 1, {})
			end
			local fixed = tt.fixed
			for i = fixed + 1, #tt.list do
				if fixed + (l - i + 1) < k then break end
				-- Copy fixed elements
				local q
				if fixed > 0 then q = table.move(tt.list, 1, fixed, 1, {}) else q = {} end
				table.move(tt.list, i, l, #q + 1, q)
				table.insert(stack, { fixed = fixed + 1, list = q })
			end
		end
	end
end

-- For verification, compute C(n,k) = n.(n-1)....(n-k+1)/k!
local function comb(n, k)
	local r = 1
	for i = n - k + 1, n do r = r * i end
	for i = 2, k do r = r / i end
	return r
end

local ln = { 1, 2, 3, 4, 5 }
local nc = 0
local k = 3
for c in Combinator(ln, k) do
	print(table.concat(c, ", "))
	nc = nc + 1
end
assert(nc == comb(#ln, k))


-- Exercises 9.3, variant over 5.4 and 5.5: return a function that evaluates a polynom
function PolynomFunction(p)
	return function(x)
		local r = 0
		for i = 1, #p do
			r = r * x + p[i]
		end
		return r
	end
end

local polynomTable = { 1, -5, 6 } -- x²-5x+6
local f = PolynomFunction(polynomTable)
print("\nx","x²-5x+6")
for x = 1.0, 4.0, 0.25 do
	print(x, f(x))
end

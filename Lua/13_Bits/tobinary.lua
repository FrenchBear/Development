-- Conversion to binary
--
-- 2022-06-23   PV

local hex2bin = {
    ['0'] = '0000',
    ['1'] = '0001',
    ['2'] = '0010',
    ['3'] = '0011',
    ['4'] = '0100',
    ['5'] = '0101',
    ['6'] = '0110',
    ['7'] = '0111',
    ['8'] = '1000',
    ['9'] = '1001',
    ['a'] = '1010',
    ['b'] = '1011',
    ['c'] = '1100',
    ['d'] = '1101',
    ['e'] = '1110',
    ['f'] = '1111',
}
local function getHex2bin(a) return hex2bin[a] end
function ToBinary(n)
	if n==0 then return "0" end
    local s = string.format('%x', n)
    return (s:gsub('.', getHex2bin):gsub('^0+',''))
end

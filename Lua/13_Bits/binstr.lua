-- Conversions integer <-> binary string
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

function Hex2Bin(a) return hex2bin[a] end

-- Format an integer as a binary string, optionally on bin positions (left-filled by zeros)
function IntToBstr(n, size)
    if n == 0 then return "0" end
    local s = string.format('%x', n):gsub('.', Hex2Bin):gsub('^0+', '')
    if size and #s < size then
        s = string.rep("0", size - #n) .. s
    end
    return s
end

-- Converts a binary string to an integer
function BstrToInt(nstr)
    local res = 0
    for i = 1, #nstr do
        res = (res << 1)
        if string.byte(nstr, i) == 49 then res = res + 1 end
    end
    return res
end

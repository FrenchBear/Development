-- allwords.lua
-- Learning Lua, play with iterators
--
-- 2022-07-07   PV      ASCII version
-- 2022-07-08   PV      UTF-8 version

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

function AllWordsASCII(file)
    local f = assert(io.open(file, "r"))
    local line = f:read("l")
    local pos = 1
    return function()
        while line do
            local w, e = string.match(line, "(%w+)()", pos)
            if w then
                pos = e
                return w
            else
                line = f:read("l")
                pos = 1
            end
        end
        if f then f:close() end
        return nil
    end
end

print("\nAllWords, ASCII version")
for w in AllWordsASCII("texte.txt") do
    print(w)
end


-- utf8 helper, basic version: Return true for most common latin letters
-- Does not support combining accents
function IsLatinLetter(c)
    return (c >= 0x41 and c <= 0x5A) or -- Uppercase Latin alphabet
        (c >= 0x61 and c <= 0x7a) or -- Lowercase Latin Alphabet
        (c >= 0xC0 and c <= 0xFF) or -- Latin-1 Supplement letters
        (c >= 0x100 and c <= 0x17F) -- Latin Extended-A: European Latin
end

function AllWordsUnicode(file)
    local function split_words(line)
        if line==nil then return line end
        local tw = {}
        local w = ""
        for _, c in utf8.codes(line) do
            if IsLatinLetter(c) then
                w = w .. utf8.char(c)
            else
                if #w > 0 then
                    tw[#tw + 1] = w
                    w = ""
                end
            end
        end
        if #w > 0 then
            tw[#tw + 1] = w
        end
        return tw
    end

    local f = assert(io.open(file, "r"))
    local words = split_words(f:read("l"))
    local pos = 1
    local word = ''
    return function()
        while words do
            if pos <= #words then
                pos = pos + 1
                return words[pos - 1]
            else
                words = split_words(f:read("l"))
                pos = 1
            end
        end
        if f then f:close() end
        return nil
    end
end

print("\nAllWords, UTF-8 version")
for w in AllWordsUnicode("texte.txt") do
    print(w)
end

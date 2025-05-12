-- markov.lua
-- Learning Lua, play with iterators
-- Markov chain, write next Harry Potter!!
--
-- 2022-07-08   PV      First version
-- 2022-07-21   PV      Use <close> attribute on file variable

-- ToDo: generalize to any number of prefix words

-- For VSCode, debug terminal is not utf8 by default

if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

math.randomseed(3)

-- This version returns words with separator at the end, whether space or line feed
function AllWordsSplitBySpace(file)
    local function split_words_on_space(line)
        if line == nil then return line end
        local tw = {}
        local w = ""
        for _, c in utf8.codes(line) do
            if c ~= 32 and c ~= 8 then
                w = w .. utf8.char(c)
            else
                if #w > 0 then
                    tw[#tw + 1] = w .. utf8.char(c)
                    w = ""
                end
            end
        end
        if #w > 0 then
            tw[#tw + 1] = w
        end
        return tw
    end

    local f <close> = assert(io.open(file, "r"))
    local words = split_words_on_space(f:read("L"))
    local pos = 1
    local word = ''
    return function()
        while words do
            if pos <= #words then
                pos = pos + 1
                return words[pos - 1] --:gsub("\r","<CR>"):gsub("\n","<LF>"):gsub("\t", "<Tab>"):gsub(" ", "<SPACE>")
            else
                words = split_words_on_space(f:read("L"))
                pos = 1
            end
        end
        -- if f then f:close() end
        return nil
    end
end

local file = [[C:\Development\TestFiles\Text\Harry Potter and the Prisoner of Azkaban.txt]]

-- Simple version with a memory of 1 predecessor
function Markov1()
    local succ = {}
    local lastw = '\n'
    local na = 0
    local nw = 0
    print("Reading " .. file)
    for w in AllWordsSplitBySpace(file) do
        local l = succ[lastw]
        if l == nil then
            succ[lastw] = { w }
            na = na + 1
            nw = nw + 1
        else
            l[#l + 1] = w
            nw = nw + 1
        end
        lastw = w
    end
    print("Analysys done, " .. na .. " anchors, " .. nw .. " words.\n")

    -- Generate 10 random paragraphs
    local start = '\n'
    local np = 0
    while true do
        local lmax = #succ[start]
        local nextw = succ[start][math.random(1, lmax)]
        io.write(nextw)
        if nextw:byte(#nextw) == 10 then
            np = np + 1
            if np == 10 then break end
        end
        start = nextw
    end
end

-- Generalized version with n predecessors
-- Generate nsent sentences
function Markov(n, nsent)
    local succ = {}
    local lasts = {}
    for i = 1, n do
        lasts[i] = '\n'
    end
    local firstword = table.concat(lasts, "|")
    local ix = 1
    local na = 0
    local nw = 0
    for w in AllWordsSplitBySpace(file) do
        local lastw = table.concat(lasts, "|", ix, ix + n - 1)
        local l = succ[lastw]
        if l == nil then
            succ[lastw] = { w }
            na = na + 1
            nw = nw + 1
        else
            l[#l + 1] = w
            nw = nw + 1
        end
        lasts[ix + n] = w
        lasts[ix] = nil
        ix = ix + 1
    end

    print("Analysys done, " .. na .. " anchors, " .. nw .. " words.\n")

    -- Generate 10 random paragraphs
    local start = firstword
    local np = 0
    while true do
        local lmax = #succ[start]
        local nextw = succ[start][math.random(1, lmax)]
        io.write(nextw)
        if nextw:byte(#nextw) == 10 then
            np = np + 1
            if np == nsent then break end
        end
        if n == 1 then
            start = nextw
        else
            local p = string.find(start, "|", 1, true)
            start = string.sub(start, p + 1) .. "|" .. nextw
        end
    end
end

Markov(3, 120)

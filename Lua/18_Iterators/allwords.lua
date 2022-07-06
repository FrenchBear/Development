-- allwords.lua
-- Learning Lua, play with iterators
--
-- 2022-07-07   PV      ASCII version

-- ToDO: Write a utf-8 version!

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

for w in AllWordsASCII("texte.txt") do
    print(w)
end

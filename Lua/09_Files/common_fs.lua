-- filesystem.lua
-- Helper functions to manage filesystem
--
-- 2022-06-16   PV
-- 2022-06-20   PV      Extension

-- Check if a file exists
function File_Exists(filename)
    local f = io.open(filename)
    if f then
        f:close()
        return true
    else
        return false
    end
end

-- Helper, returns last position of pat (plain string) in s, or nil if not found
local function instrrev(s, pat)
    local lp = 0
    while true do
        local p = string.find(s, pat, lp + 1, true)
        if p == nil then
            return lp > 0 and lp or nil
        end
        lp = p
    end
end

-- Returns a file name without path or disk parts
function FilePart(fullpath)
    local pb1 = instrrev(fullpath, [[\]]) or 0
    local pb2 = instrrev(fullpath, [[/]]) or 0
    local pb3 = instrrev(fullpath, [[:]]) or 0
    local pb = math.max(pb1, pb2, pb3)
    if pb == 0 then
        return fullpath
    else
        return string.sub(fullpath, pb + 1)
    end
end

-- Returns folder without file part.  Does not end by \ unless the file is at the root.
-- Returns an empty string if there is no folder part.
function FolderPart(fullpath)
    local pb1 = instrrev(fullpath, [[\]]) or 0
    local pb2 = instrrev(fullpath, [[/]]) or 0
    local pb3 = instrrev(fullpath, [[:]]) or 0
    local pb = math.max(pb1, pb2, pb3 + 1)
    if pb3 == 2 and math.max(pb1, pb2) == 3 then pb = pb + 1 end -- C:\File... returns C:\, that's an exception
    if pb3 == 0 and math.max(pb1, pb2) == 1 then pb = pb + 1 end -- \File... returns \, that's another exception
    if pb == 0 then
        return ""
    else
        return string.sub(fullpath, 1, pb - 1)
    end
end

-- Returns file without extension.  Heading drive and folders are preserved in result.
function Basename(fullpath)
    local pb1 = instrrev(fullpath, [[\]]) or 0
    local pb2 = instrrev(fullpath, [[/]]) or 0
    local pb3 = instrrev(fullpath, [[:]]) or 0
    local pp = instrrev(fullpath, [[.]]) or 0
    local pb = math.max(pb1, pb2, pb3)
    if pp < pb then
        return fullpath
    else
        return string.sub(fullpath, 1, pp - 1)
    end
end

-- Returns file extension, dot included, or an empty string.
function Extension(fullpath)
    local pb1 = instrrev(fullpath, [[\]]) or 0
    local pb2 = instrrev(fullpath, [[/]]) or 0
    local pb3 = instrrev(fullpath, [[:]]) or 0
    local pp = instrrev(fullpath, [[.]]) or 0
    local pb = math.max(pb1, pb2, pb3)
    if pp < pb then
        return ""
    else
        return string.sub(fullpath, pp)
    end
end

-- Returns only files of a folder, name.ext, without paths
function GetFiles(source)
    local t = {}
    local pfile = io.popen('dir /b /a-d "' .. source .. '"')
    if pfile == nil then error("popen dir " .. source .. " failed") end
    for filename in pfile:lines() do
        t[#t+1] = filename
    end
    pfile:close()
    return t
end

-- Returns only subfolders of a folder, names without paths
function GetFolders(source)
    local t = {}
    local pfile = io.popen('dir /b /ad "' .. source .. '"')
    if pfile == nil then error("popen dir " .. source .. " failed") end
    for filename in pfile:lines() do
        t[#t+1] = filename
    end
    pfile:close()
    return t
end

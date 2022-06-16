-- file.lua
-- Learning lua, play with files

require "common_fs"

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

-- Helper, returns last position of pat (plain string) in s or nil
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

-- Retourne un nom de fichier sans son chemin ni son disque
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

-- Retourne le chemin d un fichier sans son fichier
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

-- Retourne le chemin d un fichier sans extension
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

-- Retourne juste les fichiers d'un dossier, noms.ext sans chemins
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

-- Retourne juste les sous-dossiers d'un dossier, noms sans chemins
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

for _, f in ipairs(GetFiles([[C:\Temp]])) do
    print("<" .. f .. ">")
end

for _, f in ipairs(GetFolders([[C:\Temp]])) do
    print("«" .. f .. "»")
end

-- local function test(f, nf, arg, res)
--     local rc = f(arg)
--     local status
--     if rc==res then
--         status="Ok"
--     else
--         status="Problem, expected "..res
--     end
--     print(string.format("%s('%s') -> %s    %s", nf, arg, rc, status))
-- end

-- test(FilePart,   "FilePart",    [[c:\temp\f1.txt]],                    [[f1.txt]])
-- test(FolderPart, "FolderPart",  [[c:\temp\f1.txt]],                    [[c:\temp]])
-- test(Basename,   "Basename",    [[nom_de_fichier.ext]],                [[nom_de_fichier]])
-- test(Basename,   "Basename",    [[fichier]],                           [[fichie]])
-- test(Basename,   "Basename",    [[c:\p\nom_de_fichier.ext]],           [[c:\p\nom_de_fichier]])
-- test(Basename,   "Basename",    [[c:\p1.p2\file]],                     [[c:\p1.p2\file]])
-- test(FilePart,   "FilePart",    [[C:AUTOEXEC.BAT]],                    [[AUTOEXEC.BAT]])
-- test(FolderPart, "FolderPart",  [[C:AUTOEXEC.BAT]],                    [[C:]])
-- test(Basename,   "Basename",    [[C:AUTOEXEC.BAT]],                    [[C:AUTOEXEC]])
-- test(Basename,   "Basename",    [[C:AUTOEXEC.BAT]],                    [[C:AUTOEXEC]])
-- test(FilePart,   "FilePart",    [[C:\AUTOEXEC.BAT]],                   [[AUTOEXEC.BAT]])
-- test(FolderPart, "FolderPart",  [[C:\AUTOEXEC.BAT]],                   [[C:\]])
-- test(Basename,   "Basename",    [[C:\AUTOEXEC.BAT]],                   [[C:\AUTOEXEC]])
-- test(FilePart,   "FilePart",    [[C:\P\AUTOEXEC.BAT]],                 [[AUTOEXEC.BAT]])
-- test(FolderPart, "FolderPart",  [[C:\P\AUTOEXEC.BAT]],                 [[C:\P]])
-- test(Basename,   "Basename",    [[C:\P\AUTOEXEC.BAT]],                 [[C:\P\AUTOEXEC]])
-- test(FilePart,   "FilePart",    [[AUTOEXEC.BAT]],                      [[AUTOEXEC.BAT]])
-- test(FolderPart, "FolderPart",  [[AUTOEXEC.BAT]],                      [[]])
-- test(Basename,   "Basename",    [[AUTOEXEC.BAT]],                      [[AUTOEXEC]])
-- test(FilePart,   "FilePart",    [[\AUTOEXEC.BAT]],                     [[AUTOEXEC.BAT]])
-- test(FolderPart, "FolderPart",  [[\AUTOEXEC.BAT]],                     [[\]])
-- test(Basename,   "Basename",    [[\AUTOEXEC.BAT]],                     [[\AUTOEXEC]])
-- test(FilePart,   "FilePart",    [[\\Server\Share\Path\File.ext]],      [[File.ext]])
-- test(FolderPart, "FolderPart",  [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path]])
-- test(Basename,   "Basename",    [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path\File]])
-- test(Basename,   "Basename",    [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path\File]])

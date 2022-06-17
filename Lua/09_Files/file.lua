-- file.lua
-- Learning lua, play with files

require "common_fs"

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

for _, f in ipairs(GetFiles([[C:\Temp]])) do
    print("<" .. f .. ">")
end

for _, f in ipairs(GetFolders([[C:\Temp]])) do
    print("«" .. f .. "»")
end

local function test(f, nf, arg, res)
    local rc = f(arg)
    local status
    if rc==res then
        status="Ok"
    else
        status="Problem, expected "..res
    end
    print(string.format("%s('%s') -> %s    %s", nf, arg, rc, status))
end

test(FilePart,   "FilePart",    [[c:\temp\f1.txt]],                    [[f1.txt]])
test(FolderPart, "FolderPart",  [[c:\temp\f1.txt]],                    [[c:\temp]])
test(Basename,   "Basename",    [[nom_de_fichier.ext]],                [[nom_de_fichier]])
test(Basename,   "Basename",    [[fichier]],                           [[fichie]])
test(Basename,   "Basename",    [[c:\p\nom_de_fichier.ext]],           [[c:\p\nom_de_fichier]])
test(Basename,   "Basename",    [[c:\p1.p2\file]],                     [[c:\p1.p2\file]])
test(FilePart,   "FilePart",    [[C:AUTOEXEC.BAT]],                    [[AUTOEXEC.BAT]])
test(FolderPart, "FolderPart",  [[C:AUTOEXEC.BAT]],                    [[C:]])
test(Basename,   "Basename",    [[C:AUTOEXEC.BAT]],                    [[C:AUTOEXEC]])
test(Basename,   "Basename",    [[C:AUTOEXEC.BAT]],                    [[C:AUTOEXEC]])
test(FilePart,   "FilePart",    [[C:\AUTOEXEC.BAT]],                   [[AUTOEXEC.BAT]])
test(FolderPart, "FolderPart",  [[C:\AUTOEXEC.BAT]],                   [[C:\]])
test(Basename,   "Basename",    [[C:\AUTOEXEC.BAT]],                   [[C:\AUTOEXEC]])
test(FilePart,   "FilePart",    [[C:\P\AUTOEXEC.BAT]],                 [[AUTOEXEC.BAT]])
test(FolderPart, "FolderPart",  [[C:\P\AUTOEXEC.BAT]],                 [[C:\P]])
test(Basename,   "Basename",    [[C:\P\AUTOEXEC.BAT]],                 [[C:\P\AUTOEXEC]])
test(FilePart,   "FilePart",    [[AUTOEXEC.BAT]],                      [[AUTOEXEC.BAT]])
test(FolderPart, "FolderPart",  [[AUTOEXEC.BAT]],                      [[]])
test(Basename,   "Basename",    [[AUTOEXEC.BAT]],                      [[AUTOEXEC]])
test(FilePart,   "FilePart",    [[\AUTOEXEC.BAT]],                     [[AUTOEXEC.BAT]])
test(FolderPart, "FolderPart",  [[\AUTOEXEC.BAT]],                     [[\]])
test(Basename,   "Basename",    [[\AUTOEXEC.BAT]],                     [[\AUTOEXEC]])
test(FilePart,   "FilePart",    [[\\Server\Share\Path\File.ext]],      [[File.ext]])
test(FolderPart, "FolderPart",  [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path]])
test(Basename,   "Basename",    [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path\File]])
test(Basename,   "Basename",    [[\\Server\Share\Path\File.ext]],      [[\\Server\Share\Path\File]])

-- filesystem.lua
-- Helper functions to manage filesystem
--
-- 2022-06-16   PV

function File_Exists(filename)
    local f = io.open(filename)
    if f then
        f:close()
        return true
    else
        return false
    end
end

-- dynamic_names.lua
-- Learning Lua, use strict
--
-- 2022-07-21   PV      First version

-- without this require, code works fine
require 'strict'

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


print(a)       -- 'a’ is the first appearing variable, so error

require "strict"
function f() 
  b = 2        -- error because a value is substituted for global variable for the first time within the function
end
f()            -- halt due to error

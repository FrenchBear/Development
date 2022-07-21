-- Can't find a simple working implementation of strict.lua, online versions
-- are overcomplicated or contain deprecated code.
-- This one is coming from 'Programming in Lua, 4th ed'
--
-- 2022-07-21  PV

local declaredNames = {}
setmetatable(_G, {
   __newindex = function(t, n, v)
      if not declaredNames[n] then
         local w = debug.getinfo(2, "S").what
         if w ~= "main" and w ~= "C" then
            error("attempt to write to undeclared variable " .. n, 2)
         end
         declaredNames[n] = true
      end
      rawset(t, n, v) -- do the actual set
   end,
   __index = function(_, n)
      if not declaredNames[n] then
         error("attempt to read undeclared variable " .. n, 2)
      else
         return nil
      end
   end,
})

-- sock.lua
-- Learning Lua, play with network functions
--
-- 2022-07-23   PV      First version

-- For VSCode, debug terminal is not utf8 by default
if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end


local socket = require "socket"
local host = "www.lua.org"
local file = "/manual/5.3/manual.html"
local c = assert(socket.connect(host, 80))
local request = string.format(
    "GET %s HTTP/1.0\r\nhost: %s\r\n\r\n", file, host)
c:send(request)
repeat
    local s, status, partial = c:receive(2 ^ 10)
    io.write(s or partial)
until status == "closed"

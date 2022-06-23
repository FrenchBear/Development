-- datetime.lua
-- Learning lua, date and time manipulation
-- Start with completely manual code, mays switch to a getopt function later
--
-- 2022-06-23   PV

-- For VSCode, debug terminal is not utf8 by default
os.execute("chcp 65001 >NUL")

print("Current time", os.time()) -- Time in seconds since 1/1/1970

-- Can specify a date to convert to seconds
print("Time of 2022-06-23", os.time({ year = 2022, month = 6, day = 23 }))

-- But doesn't work with a date <1970...
-- print(os.time({year=1965, month=2, day=26}))

-- os.date converts a time to a high level representation; *t fill all fields:
print("\nCurrent time")
local dt = os.date("*t", os.time())
for k, v in pairs(dt) do
    print(k, v)
end

print("\nCurrent UTC time")
dt = os.date("!*t", os.time())
for k, v in pairs(dt) do
    print(k, v)
end

-- sec     44
-- hour    14
-- month   6
-- day     23
-- year    2022
-- wday    5
-- isdst   true
-- yday    174
-- min     6

-- os.date with no arguments formats current time using %c specifier
print("\nIt is    ", os.date())

-- more os.date format specifiers:
print("Date+Time    ", os.date("%Y-%m-%d %H:%M:%S", os.time()))
print("Date+Time+TZ ", os.date("%Y-%m-%d %H:%M:%S %z", os.time())) -- With timezone, but not good on Windows (Romance Daylight Time...)
print("UTC Date+Time", os.date("!%Y-%m-%d %H:%M:%S", os.time())) -- UTC
-- %a abbreviated weekday name (e.g., Wed)
-- %A full weekday name (e.g., Wednesday)
-- %b abbreviated month name (e.g., Sep)
-- %B full month name (e.g., September)
-- %c date and time (e.g., 09/16/98 23:48:10)
-- %d day of the month (16) [01–31]
-- %H hour, using a 24-hour clock (23) [00–23]
-- %I hour, using a 12-hour clock (11) [01–12]
-- %j day of the year (259) [001–365]
-- %m month (09) [01–12]
-- %M minute (48) [00–59]
-- %p either "am" or "pm" (pm)
-- %S second (10) [00–60]
-- %w weekday (3) [0–6 = Sunday–Saturday]
-- %W week of the year (37) [00–53]
-- %x date (e.g., 09/16/98)
-- %X time (e.g., 23:48:10)
-- %y two-digit year (98) [00–99]
-- %Y full year (1998)
-- %z timezone (e.g., -0300)
-- %% a percent sign

-- Current TZ delta 
-- if we're unlucky, we may have 1 second diff between the calls, could fix that since both should have same seconds field
local ttz = os.date("*t")
local tutc = os.date("!*t")
local deltatz = os.difftime(os.time(ttz), os.time(tutc))
if ttz.isdst then deltatz = deltatz + 3600 end
print("Timezone delta", deltatz / 3600)

-- In three hours from now
local ft = os.time() + 3 * 60 * 60
print("In 3 hours ", os.date("%d/%m/%Y %H:%M:%S", ft))

-- More precise, os.clock returns the sime (fload seconds) since program started, can be used to time code execution
print("\nos.clock()", os.clock())

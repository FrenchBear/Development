-- Very first Lua program
--
-- 2022-06-04   PV

local s = '𝄞'
print(s)

-- Corners ASCII, Simple, Rounded, Bold, Double
CornersA = { " ", "|", "-", "+", "|", "|", "+", "+", "-", "+", "-", "+", "+", "+", "+", "+", "*", }
CornersS = { " ", "│", "─", "└", "│", "│", "┌", "├", "─", "┘", "─", "┴", "┐", "┤", "┬", "┼", "█", }
CornersR = { " ", "╵", "╶", "╰", "╷", "│", "╭", "├", "╴", "╯", "─", "┴", "╮", "┤", "┬", "┼", "█", }
CornersB = { " ", "╹", "╺", "┗", "╻", "┃", "┏", "┣", "╸", "┛", "━", "┻", "┓", "┫", "┳", "╋", "█", }
CornersD = { " ", "║", "═", "╚", "║", "║", "╔", "╠", "═", "╝", "═", "╩", "╗", "╣", "╦", "╬", "█", }

-- Default is ASCII
Corners = CornersD

for i = 1, #Corners do
    print(Corners[i])
end

-- Example of config file in Lua ear from a C application
-- 2022-08-07   PV

-- define window size
Width = 200
Height = 300 + 50

-- Variables RED, GREEN, BLUE and WHITE are predefined by C
Background = RED
Foreground = { red = 0.8, green = 0.8, blue = 0.8 }
Border = 'BLUE'

-- An example of function to call from C
function f1(x, y)
    return (x ^ 2 * math.sin(y)) / (1 - x)
end

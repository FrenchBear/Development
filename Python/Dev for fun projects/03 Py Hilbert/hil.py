# hil.py - Hilbert curve in text mode in Python
# Use a L-system for simple generation
# Output is drawn in matrix tc, each cell containing a box character that is function of how
#   we enter and exit the cell, encoding provided by io[entrance][exit]
# Finally dictionary box provides the actual representation of codes of io stored in tc
#
# 2015-05-09    PV

"""
Level = 3
Side = 8
┌─┐ ┌─┐ ┌─┐ ┌─┐
│ └─┘ │ │ └─┘ │
└─┐ ┌─┘ └─┐ ┌─┘
┌─┘ └─────┘ └─┐
│ ┌───┐ ┌───┐ │
└─┘ ┌─┘ └─┐ └─┘
┌─┐ └─┐ ┌─┘ ┌─┐
│ └───┘ └───┘ │
"""

import math

level = 4                           # Level 1 is the first drawing as an upside down U
side = int(math.pow(2, level))      # side of output square grid

# Just some trace
print('Level = '+str(level))
print('Side = '+str(side))

tc = [['' for x in range(side)]     # Table of cells for output
          for y in range(side)] 

# In Out cell encoding matrix
# Row = cell entrance orientation, 0..3 and 4 when there is no actual entrance (1st cell)
# Column = cell exit orientation, 0..3 and 4 for the last cell
# In the table xx=invalid combination, otherwise represent a box character (see box dictionary)
io = [['hz', 'ul', 'xx', 'dl', 'hz'],
      ['dr', 'vt', 'dl', 'xx', 'vt'],
      ['xx', 'ur', 'hz', 'dr', 'hz'],
      ['ur', 'xx', 'ul', 'vt', 'vt'],
      ['hz', 'vt', 'hz', 'vt', 'xx']]

# Unicode box characters
box = {
    'hz': '\u2500\u2500',   # Horizontal
    'vt': '\u2502 ',        # Vertical
    'dr': '\u250c\u2500',   # Down Right
    'dl': '\u2510 ',        # Down Left
    'ur': '\u2514\u2500',   # Up Right
    'ul': '\u2518 '         # Up Left
    }

a = 0       # Current angular orientation: 0=East, 1=North, 2=West, 3=South
en = 4      # Previous cell entrance
cx = 0      # Current x
cy = side-1 # Current y


# Simple recursive L-System generator for a Hilbert curve
# Recursively process building rules X and Y
def ls2(d, s):
    if d==0:
        dr(s)
    else:
        for c in s:
            if c=='X':
                ls2(d-1, '-YF+XFX+FY-')
            elif c=='Y':
                ls2(d-1, '+XF-YFY-FX+')
            else:
                dr(c)

    
def dr(s):
    global a, cx, cy, en, tc
    for c in s:
        if c=='-':          # Rotate 90° anti clockwise = increment a (modulo 4)
            a = (a+1)%4
        elif c=='+':        # Rotate 90° clockwise = decrement a (modulo 4)
            a = (a+3)%4
        elif c=='F':        # Forward drawing instruction
            # Compute next cell coordinates after drawing 1 unit in direction indicated by a
            nx, ny = {
                0: (cx+1, cy),
                1: (cx, cy-1),
                2: (cx-1, cy),
                3: (cx, cy+1)
                }[a]
            tc[cy][cx] = io[en][a]
            cx, cy = (nx, ny)   # Move to next cell
            en = a              # use current orientation as entrance index for next cell

# Final drawing function 
def output():
    for y in range(side):
        for x in range(side):
            print(box[tc[y][x]], end='')
        print()
    print()


# Generate the curve, initial pattern X
ls2(level, 'X')
tc[cy][cx] = io[en][4]          # Fill the last cell, since in the body we always fill previous cell

print()
output()

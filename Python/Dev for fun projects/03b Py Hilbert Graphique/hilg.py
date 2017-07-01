# hilg.py - Hilbert curve in graphics mode in Python
# Use a L-system for simple generation
#
# 2015-05-09    PV      Text version
# 2015-05-18    PV      Graphical version with tk

import math
from tkinter import *


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

# Drawing function, process drawing rules    
def dr(s):
    global a, cx, cy, mod, canvas
    for c in s:
        if c=='-':          # Rotate 90° anti clockwise = increment a (modulo 4)
            a = (a+1)%4
        elif c=='+':        # Rotate 90° clockwise = decrement a (modulo 4)
            a = (a+3)%4
        elif c=='F':        # Forward drawing instruction
            # Compute next cell coordinates after drawing 1 unit in direction indicated by a
            nx, ny = {
                0: (cx+mod, cy),
                1: (cx, cy-mod),
                2: (cx-mod, cy),
                3: (cx, cy+mod)
                }[a]

            # draw 
            canvas.create_line(cx, cy, nx, ny, fill='black', width=1)        

            cx, cy = nx, ny   # Move to next cell


level = 6                           # level 1 is the first drawing as an upside down U
mod = 5                             # size in pixels of one cell
a = 0
side = int(math.pow(2, level))      # side of output square grid

root = Tk()
canvas = Canvas(root, width=mod*side, height=mod*side)
canvas.pack()
root.wm_title('03b Hilbert Curve')

cx = mod/2                          # initial coordinates
cy = mod*(side-1/2)

ls2(level, 'X')

root.mainloop()

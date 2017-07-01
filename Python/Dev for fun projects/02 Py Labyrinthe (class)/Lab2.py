# lab2.py
# Generates a random maze, Python version
# 2015-05-03    PV  First version, without objects, in text mode, no solution
# 2015-05-03    PV  Second version vith objects and solver

"""
+-+-+-+-+-+-+-+-+#+-+-+-+-+-+-+-+-+-+-+-+
|       |   |    #|###|#########|###|   |
+ + +-+ + + +-+-+#+#+#+#+-+ + +#+#+#+ + +
| | | |   |   |  ###|#|#|   | |###|#| | |
+ + + +-+-+-+ + +-+-+#+#+ +-+-+-+-+#+ +-+
| | |   |   |   |   |###| |#########|   |
+ + + + +-+ +-+-+ +-+-+-+-+#+-+-+-+-+-+ +
| | | |     |         |#####|       | | |
+ +-+ +-+-+-+ +-+-+-+-+#+ +-+ +-+-+ + + +
|     |   |       |#####| | | |   |   | |
+-+-+-+ + + +-+-+ +#+-+-+ + + + + +-+-+ +
|       |       | |###|   |   | |   | | |
+ +-+-+-+-+-+-+ + +-+#+-+ +-+ + +-+ + + +
| |   | |       | |  ###|   | |   | |   |
+ +-+ + + +-+ +-+ +-+-+#+-+-+ +-+ +-+ + +
|     |     |   |      ###############| |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+#+-+
"""

import random
import sys

# When running in Windows, ANSI console sequences seem not rendered correctly
# simple_output = True if 'idlelib.run' in sys.modules else False
simple_output = True

# Control size
rows = 8
columns = 20

if (len(sys.argv)==3):
    rows = int(sys.argv[1])
    columns = int(sys.argv[2])
    if rows<5 or rows>200 or columns<5 or columns>200:
        print("lab1: rows and columns arguments must be in the range 5..200")
        sys.exit()

if len(sys.argv)!=1 and len(sys.argv)!=3:
    print("Usage: python3 lab1.py rows columns")
    sys.exit()


# A simple class to represent a cell in the maze
# Actually just a data structure
# Initialized walled, unvisited (generation), unexplored (solution)
class square:
    def __init__(self):
        self.walls = [True, True]       # index 0=bottom, 1=right 
        self.visited = False            # for generation
        self.dir_sol = 0                # direction of solution


# 2-dimension list of cells, walls everywhere and unvisited
# row and column 0 are here only to represent top/left walls of row/column 1
cells = [[square() for x in range(columns+1)]
                   for x in range(rows+1)] 


# Dig a gallery
def dig(r,c):
    global cells, remaining

    while True:
        # First cell of a gallery is always visited, except the 1st cell of the 1st gallery
        if not cells[r][c].visited:
            cells[r][c].visited = True
            remaining -= 1

        # Chose a random direction: 0=right, 1=top, 2=left, 3=bottom
        dir = random.randint(0,3)
        nt = 1      # Number of tests
        while True:
            rn,cn,rt,ct,iw = {
                0: (r,c+1,r,c,1),
                1: (r-1,c,r-1,c,0),
                2: (r,c-1,r,c-1,1),
                3: (r+1,c,r,c,0)
                }[dir]      # Next row/col, Update row/col, index of wall for cell update

            # Is next cell in the maze?
            if rn>=1 and rn<=rows and cn>=1 and cn<=columns:
                if not cells[rn][cn].visited:
                    # Ok, cell is accepted
                    break
            
            # Not Ok, we turn direction 90 degrees
            dir = (dir+1)%4
            nt += 1
            if nt==5:
                # All directions explored, no adjacent cell unexplored
                return
            
        # Erase the border
        cells[rt][ct].walls[iw] = False

        # Move to next cell
        r,c = rn,cn

        
def print_labyrinth():
    path_dot = '\u2588' if simple_output else '\033[43m \033[40m'
    for rl in range(rows+1):
        # 1st line, cell interior and right wall, not on row 0
        if rl>0:
            for cl in range(columns+1):
                col = cells[rl][cl]
                # Cell interior, not on column 0
                if cl>0:
                    print(path_dot if col.dir_sol==6 else ' ' if col.visited else '?', end='')
                # Right wall
                if col.walls[1] or cl==columns:
                    print('|', end='')
                else:
                    print(path_dot if col.dir_sol==6 and cells[rl][cl+1].dir_sol==6 else ' ', end='')
            print()
        # 2nd line, bottom wall
        for cl in range(columns+1):
            col=cells[rl][cl]
            # Bottom wall, not on column 0
            if cl>0:
                if col.walls[0] or rl==rows or rl==0:
                    print('-' if col.walls[0] else path_dot, end='')
                else:
                    print(path_dot if col.dir_sol==6 and cells[rl+1][cl].dir_sol==6 else ' ', end='')
            # Bottom right corner, always a +
            print('+', end='')
        print()

def solve(rs,cs,re,ce):
    global cells, finished
    cells[re][ce].dir_sol = 6       # Mark end cell as part of solution
    search(rs,cs)

    # Mark all cells in current path as being part of the solution
    for row in cells:
        for cell in row:
            if cell.dir_sol>=1 and cell.dir_sol<=4:
                cell.dir_sol = 6

def search(r,c):
    global cells, finished
    for dir in range(4):
        cells[r][c].dir_sol = dir+1
        rn,cn,rt,ct,iw = {
            0: (r,c+1,r,c,1),
            1: (r-1,c,r-1,c,0),
            2: (r,c-1,r,c-1,1),
            3: (r+1,c,r,c,0)
            }[dir]      # Next row/col, Update row/col, index of wall for cell update
        # If next cell in the maze
        if rn>=1 and rn<=rows and cn>=1 and cn<=columns:
            # No wall?
            if not cells[rt][ct].walls[iw]:
                if cells[rn][cn].dir_sol==6:    # Found exit cell
                    finished = True
                    return
                if cells[rn][cn].dir_sol==0:
                    search(rn,cn)
                    if finished:
                        return
    cells[r][c].dir_sol = 5         # Not part of solution

    
finished = False
remaining = rows*columns

# First cell, completely random
i = random.randint(1, rows)
j = random.randint(1, columns)
dig(i,j)

# Then continue digging starting with an explored cell until no unexplored cell remains
while remaining>0:
    i = random.randint(1, rows)
    j = random.randint(1, columns)
    while not cells[i][j].visited:
        i+=1
        if i>rows:
            i = 1
            j = (j%columns)+1
    dig(i, j)

# Finally chose a random entry and exit
cs = random.randint(1, columns)     # Column start
ce = random.randint(1, columns)     # Column exit
cells[0][cs].walls[0] = False
cells[rows][ce].walls[0] = False

# Show generated maze
# print_labyrinth()
# print()

# Find a solution
solve(1,cs,rows,ce)

# Print maze with solution
print_labyrinth()



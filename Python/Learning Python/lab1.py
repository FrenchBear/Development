# lab.py
# Generates a random maze, Python version
# 2015-05-03    PV  First version, without objects, in text mode, no solution

import random
import sys

# Control size
rows = 10
columns = 38

if (len(sys.argv)==3):
    rows = int(sys.argv[1])
    columns = int(sys.argv[2])
    if rows<5 or rows>200 or columns<5 or columns>200:
        print("lab1: rows and columns arguments must be in the range 5..200")
        sys.exit()

if len(sys.argv)!=1 and len(sys.argv)!=3:
    print("Usage: python3 lab1.py rows columns")
    sys.exit()

# Bit flags for cells
# bit 0: 0 when not visited, 1 when visited
# bit 1: bottom wall = top wall of cell of row+1
# bit 2: right wall = left wall of cell of column+1
bf_visited = 1
bf_bottom = 2
bf_right = 4

# 2-dimension list of cells, walls everywhere and unvisited
# row and column 0 are here only to represent top/left walls of row/column 1
cells = Matrix = [[bf_bottom|bf_right for x in range(columns+1)]
                  for x in range(rows+1)] 


# Dig a gallery
def creuse(r,c):
    global cells, remaining

    while True:
        # First cell of a gallery is always visited, except the 1st cell of the 1st gallery
        if cells[r][c]&bf_visited==0:
            cells[r][c] |= bf_visited
            remaining -= 1

        # Chose a random direction: 0=right, 1=top, 2=left, 3=bottom
        dir = random.randint(0,3)
        nt = 1      # Number of tests
        while True:
            rn,cn,ru,cu,bm = {
                0: (r,c+1,r,c,~bf_right),
                1: (r-1,c,r-1,c,~bf_bottom),
                2: (r,c-1,r,c-1,~bf_right),
                3: (r+1,c,r,c,~bf_bottom)
                }[dir]      # Next row/col, Update row/col, mask for cell update

            # Is next cell in the maze?
            if rn>=1 and rn<=rows and cn>=1 and cn<=columns:
                if cells[rn][cn]&bf_visited==0:
                    # Ok, cell is accepted
                    break
            
            # Not Ok, we turn direction 90 degrees
            dir = (dir+1)%4
            nt += 1
            if nt==5:
                # All directions explored, no adjacent cell undexplored
                return
            
        # Erase the border
        cells[ru][cu] &= bm

        # Move to next cell
        r,c = rn,cn

        
def print_labyrinth():
    r = 0
    for row in cells:
        # 1st line, cell interior and right wall, not on row 0
        if r>0:
            c = 0
            for col in row:
                # Cell interior, not on column 0
                if c>0:
                    # Only for intermediate tests since at the end no unexplored cell remain
                    # print('*' if col&bf_visited==0 else ' ', end='')
                    print(' ', end='')
                # Right wall
                print(' ' if col&bf_right==0 else '|', end='')
                c+=1
            print()
        # 2nd line, bottom wall
        c = 0
        for col in row:
            # Bottom wall, not on column 0
            if c>0:
                print(' ' if col&bf_bottom==0 else '-', end='')
            # Bottom right corner, always a +
            print('+', end='')
            c += 1
        print()
        r += 1


remaining = rows*columns

# First cell, completely random
i = random.randint(1, rows)
j = random.randint(1, columns)
creuse(i,j)

# Then continue digging startint with an explored cell until no unexplored cell remains
while remaining>0:
    i = random.randint(1, rows)
    j = random.randint(1, columns)
    while cells[i][j]&bf_visited==0:
        i+=1
        if i>rows:
            i = 1
            j = (j%columns)+1
    creuse(i, j)

# Finally chose a random entry and exit
cells[0][random.randint(1, columns)] &= ~bf_bottom
cells[rows][random.randint(1, columns)] &= ~bf_bottom

# Show generated mawe
print_labyrinth()


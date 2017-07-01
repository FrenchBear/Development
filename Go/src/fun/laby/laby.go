// Labyrinthe en Go
// Development for fun project #1
// go install fun/laby
// 2016-04-12	PV

/*
+-+-+-+-+-+-+-+-+-+-+-+-+#+-+-+-+-+-+-+-+
|                ###    |###|           |
+ +-+-+-+-+-+-+-+#+#+-+-+ +#+ +-+-+-+-+ +
| |###############|#####| |#| |   |     |
+ +#+-+-+-+-+ +-+-+-+-+#+-+#+ +-+ + +-+-+
| |#######  |   |     |#####|   | | |   |
+ +-+-+-+#+-+-+ + +-+ +-+-+-+-+ + + + + +
| |     |#####|     |   |     |   | | | |
+ + +-+ +-+-+#+-+-+-+-+ +-+-+ + +-+ + +-+
| | | |     |#######| |   |   | | | |   |
+ + + +-+ + +-+-+-+#+ +-+ + +-+ + + +-+ +
| | |   | | |#######|     | |     |   | |
+ + + +-+ + +#+-+-+-+-+-+-+ +-+-+-+-+ + +
|   |     | |#|#####      |   |       | |
+-+-+-+-+-+ +#+#+-+#+-+-+-+-+ +-+ +-+-+ +
|           |###  |#############        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+#+-+-+-+-+
*/

package main

import (
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"time"
)

// A simple struct to represent a cell in the labyrinth
type cell struct {
	walls   [2]bool // index 0=bottom, 1=right
	visited bool    // for generation
	dirsol  int     // direction explored searching for solution, 6=part of solution
}

var rows = 8
var columns = 20
var cells [][]cell
var rnd *rand.Rand
var remaining int
var finished bool

func main() {
	// Process optional command line arguments
	if len(os.Args) != 1 && len(os.Args) != 3 {
		fmt.Println("Usage: laby [rows columns]")
		return
	}

	if len(os.Args) == 3 {
		var err1, err2 error
		rows, err1 = strconv.Atoi(os.Args[1])
		columns, err2 = strconv.Atoi(os.Args[2])
		if err1 != nil || err2 != nil || rows < 5 || rows > 200 || columns < 5 || columns > 200 {
			fmt.Println("Laby: row and columns arguments must be in the range 5..200")
			return
		}
	}

	// cells array creation and initialization
	// row and column zero only represents top/left walls of row/column one
	cells = make([][]cell, rows+1)
	for r := range cells {
		cells[r] = make([]cell, columns+1)
		for c := 0; c <= columns; c++ {
			cells[r][c] = cell{[2]bool{true, true}, false, 0} // Walled and unvisited
		}
	}

	rnd = rand.New(rand.NewSource(time.Now().UnixNano()))
	remaining = rows * columns
	finished = false

	// First cell, random
	i, j := rnd.Intn(rows)+1, rnd.Intn(columns)+1
	dig(i, j)

	// Then continue digging starting with explored cell until no unexplored cell remains
	for remaining > 0 {
		i, j = rnd.Intn(rows)+1, rnd.Intn(columns)+1
		for !cells[i][j].visited {
			i++
			if i > rows {
				i = 1
				j = (j % columns) + 1
			}
		}
		dig(i, j)
	}

	// Finally chose a random entry and exit
	cs := 1 + rnd.Intn(columns) // Column start
	ce := 1 + rnd.Intn(columns) // Column exit
	cells[0][cs].walls[0] = false
	cells[rows][ce].walls[0] = false

	// Find a solution
	solve_labyrinth(1, cs, rows, ce)

	// Print labyrinth with solution
	print_labyrinth()
}

func dig(r int, c int) {
	for {
		// First cell is always visited, except the very first one
		if !cells[r][c].visited {
			cells[r][c].visited = true
			remaining--
		}

		// Chose a random direction, 0=right, 1=top, 2=left, 3=bottom
		dir := rnd.Intn(4)
		nt := 1        // Number of tests
		rn, cn := 0, 0 // Next row/col
		rt, ct := 0, 0 // Update row/col
		iw := 0        // Index of wall for cell update

		for {
			if dir == 0 {
				rn, cn = r, c+1
				rt, ct = r, c
				iw = 1
			} else if dir == 1 {
				rn, cn = r-1, c
				rt, ct = r-1, c
				iw = 0
			} else if dir == 2 {
				rn, cn = r, c-1
				rt, ct = r, c-1
				iw = 1
			} else if dir == 3 {
				rn, cn = r+1, c
				rt, ct = r, c
				iw = 0
			}
			// Is next cell in the labyrinth?
			if rn >= 1 && rn <= rows && cn >= 1 && cn <= columns {
				if !cells[rn][cn].visited {
					break
				} // Newt cell is accepted
			}

			// Not Ok, we turn 90 degree
			dir = (dir + 1) % 4
			nt++
			if nt == 5 {
				return
			} // All directions explored, no adjacent unexplored cell
		}

		// Erase the border
		cells[rt][ct].walls[iw] = false

		// Move to next cell
		r, c = rn, cn
	}
}

func solve_labyrinth(rs int, cs int, re int, ce int) {
	cells[re][ce].dirsol = 6 // Mark end cell part of the solution
	search(rs, cs)

	// Mark all cells in current path as being part of the solution
	for r := 0; r <= rows; r++ {
		for c := 0; c <= columns; c++ {
			if cells[r][c].dirsol >= 1 && cells[r][c].dirsol <= 4 {
				cells[r][c].dirsol = 6
			}
		}
	}
}

func search(r int, c int) {
	for dir := 0; dir < 4; dir++ {
		cells[r][c].dirsol = dir + 1
		rn, cn := 0, 0 // Next row/col
		rt, ct := 0, 0 // Update row/col
		iw := 0

		if dir == 0 {
			rn, cn = r, c+1
			rt, ct = r, c
			iw = 1
		} else if dir == 1 {
			rn, cn = r-1, c
			rt, ct = r-1, c
			iw = 0
		} else if dir == 2 {
			rn, cn = r, c-1
			rt, ct = r, c-1
			iw = 1
		} else if dir == 3 {
			rn, cn = r+1, c
			rt, ct = r, c
			iw = 0
		}

		// If next cell is in the labyrinth
		if rn >= 1 && rn <= rows && cn >= 1 && cn <= columns {
			// No wall?
			if !cells[rt][ct].walls[iw] {
				if cells[rn][cn].dirsol == 6 { // found Exit cell
					finished = true
					return
				}
				if cells[rn][cn].dirsol == 0 {
					search(rn, cn)
					if finished {
						return
					}
				}
			}
		}
	}

	cells[r][c].dirsol = 5 // Not part of the solution
}

func print_labyrinth() {
	const path_dot = "#"

	for r1 := 0; r1 <= rows; r1++ {
		// 1st line, cell interior and right wall, now on row 0
		if r1 > 0 {
			for c1 := 0; c1 <= columns; c1++ {
				col := cells[r1][c1]
				// Cell interior
				if c1 > 0 {
					if col.dirsol == 6 {
						fmt.Print(path_dot)
					} else {
						fmt.Print(" ")
					}
				}
				// Right wall
				if col.walls[1] || c1 == columns {
					fmt.Print("|")
				} else {
					if col.dirsol == 6 && cells[r1][c1+1].dirsol == 6 {
						fmt.Print(path_dot)
					} else {
						fmt.Print(" ")
					}
				}
			}
			fmt.Println()
		}
		// 2nd line, bottom wall
		for c1 := 0; c1 <= columns; c1++ {
			col := cells[r1][c1]
			// Bottom wall, not on column 0
			if c1 > 0 {
				if col.walls[0] || r1 == rows || r1 == 0 {
					if col.walls[0] {
						fmt.Print("-")
					} else {
						fmt.Print(path_dot) // Entrance or Exit
					}
				} else {
					if col.dirsol == 6 && cells[r1+1][c1].dirsol == 6 {
						fmt.Print(path_dot)
					} else {
						fmt.Print(" ")
					}
				}
			}
			// Bottom right cornet, always a +
			fmt.Print("+")
		}
		fmt.Println()
	}
}

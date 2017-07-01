// Hilbert text en Go
// Development for fun project #2b
// go install fun/hiltext
// 2016-04-15	PV		Code based on hilgraph (graphical version)
/*
Level= 4
Side= 16
┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
│ └─┘ │ │ └─┘ │ │ └─┘ │ │ └─┘ │
└─┐ ┌─┘ └─┐ ┌─┘ └─┐ ┌─┘ └─┐ ┌─┘
┌─┘ └─────┘ └─┐ ┌─┘ └─────┘ └─┐
│ ┌───┐ ┌───┐ │ │ ┌───┐ ┌───┐ │
└─┘ ┌─┘ └─┐ └─┘ └─┘ ┌─┘ └─┐ └─┘
┌─┐ └─┐ ┌─┘ ┌─┐ ┌─┐ └─┐ ┌─┘ ┌─┐
│ └───┘ └───┘ └─┘ └───┘ └───┘ │
└─┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌─┘
┌─┘ └─┐ └─┘ ┌─┘ └─┐ └─┘ ┌─┘ └─┐
│ ┌─┐ │ ┌─┐ └─┐ ┌─┘ ┌─┐ │ ┌─┐ │
└─┘ └─┘ │ └───┘ └───┘ │ └─┘ └─┘
┌─┐ ┌─┐ │ ┌───┐ ┌───┐ │ ┌─┐ ┌─┐
│ └─┘ │ └─┘ ┌─┘ └─┐ └─┘ │ └─┘ │
└─┐ ┌─┘ ┌─┐ └─┐ ┌─┘ ┌─┐ └─┐ ┌─┘
──┘ └───┘ └───┘ └───┘ └───┘ └───
*/

package main

import (
	"fmt"
	"math"
	"os"
	"strconv"
)

var level = 4  // Mevel 1 is the first drawing as an upside down U
var side int   // Side of output grid
var a int      // Current rotation angle 0 to 3 (to multiply by 90°)
var en int     // Current cell entrance
var cx, cy int // Current coordinates

var tc [][]string   // Table of cells
var io [5][5]string // Calls [entrance angle][exit angle]

func main() {
	// Process optional command line argument
	if len(os.Args) != 1 && len(os.Args) != 2 {
		fmt.Println("Usage: laby [level]")
		fmt.Println("level int in 1..12 range, default is 6")
		return
	}

	if len(os.Args) == 2 {
		var err error
		level, err = strconv.Atoi(os.Args[1])
		if err != nil || level < 1 || level > 12 {
			fmt.Println("hilgraph: level argument must be in the range 1..12")
			return
		}
	}

	// Starting values
	side = int(math.Pow(2.0, float64(level))) // side of output square grid
	a = 0
	en = 4
	cx = 0 // initial coordinates
	cy = side - 1

	tc = make([][]string, side)
	for r := 0; r < side; r++ {
		tc[r] = make([]string, side)
	}

	// In Out cell encoding matrix
	// Row = cell entrance orientation, 0..3 and 4 when there is no actual entrance (1st cell)
	// Column = cell exit orientation, 0..3 and 4 for the last cell
	// In the table xx=invalid combination, otherwise represent a box character (see box dictionary)
	io = [5][5]string{[5]string{"hz", "ul", "xx", "dl", "hz"},
		[5]string{"dr", "vt", "dl", "xx", "vt"},
		[5]string{"xx", "ur", "hz", "dr", "hz"},
		[5]string{"ur", "xx", "ul", "vt", "vt"},
		[5]string{"hz", "vt", "hz", "vt", "xx"}}

	// Unicode box characters
	box := map[string]string{
		"hz": "\u2500\u2500", // Horizontal
		"vt": "\u2502 ",      // Vertical
		"dr": "\u250c\u2500", // Down Right
		"dl": "\u2510 ",      // Down Left
		"ur": "\u2514\u2500", // Up Right
		"ul": "\u2518 "}      // Up Left

	ls2(level, "X")
	tc[cy][cx] = io[en][4] // Fill the last cell, since in the body we always fill previous cell

	// Output
	fmt.Println("Level=", level)
	fmt.Println("Side=", side)
	for y := 0; y < side; y++ {
		for x := 0; x < side; x++ {
			fmt.Print(box[tc[y][x]])
		}
		fmt.Println()
	}
}

// Simple recursive L-System generator for a Hilbert curve
// Recursively process building rules X and Y
func ls2(d int, s string) {
	if d == 0 {
		dr(s)
	} else {
		for _, c := range s {
			if c == 'X' {
				ls2(d-1, "-YF+XFX+FY-")
			} else if c == 'Y' {
				ls2(d-1, "+XF-YFY-FX+")
			} else {
				dr(string(c))
			}
		}
	}
}

// Drawing function, process drawing rules
// Actually fills tc (output table)
func dr(s string) {
	for _, c := range s {
		if c == '-' { // Rotate 90° anti clockwise = increment a (modulo 4)
			a = (a + 1) % 4
		} else if c == '+' { // Rotate 90° clockwise = decrement a (modulo 4)
			a = (a + 3) % 4
		} else if c == 'F' { // Forward drawing instruction
			var nx, ny int
			// Compute next cell coordinates after drawing 1 unit in direction indicated by a
			if a == 0 {
				nx, ny = cx+1, cy
			} else if a == 1 {
				nx, ny = cx, cy-1
			} else if a == 2 {
				nx, ny = cx-1, cy
			} else if a == 3 {
				nx, ny = cx, cy+1
			}
			tc[cy][cx] = io[en][a]
			cx, cy = nx, ny // Move to next cell
			en = a          // Use current orientation as entrance index for next cell
		}
	}
}

// Hilbert graphique en Go
// Development for fun project #2
// go install fun/hilgraph
// 2016-04-14	PV		Code based on Python version, irself based on HP Prime version

package main

import (
	"fmt"
	"image"
	"image/color"
	"image/gif"
	"math"
	"os"
	"strconv"
)

var level = 6  // level 1 is the first drawing as an upside down U
var mod = 5    // size in pixels of one cell

var side int   // Side of output square grid
var a int      // Current rotation angle (to multiply by 90°)
var cx, cy int // Current coordinates

var palette = []color.Color{color.White, color.Black}
var img *image.Paletted

const (
	whiteIndex = 0 // first color in palette
	blackIndex = 1 // next color in palette
)


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
	cx = mod / 2                              // initial coordinates
	cy = mod*side - mod/2

	anim := gif.GIF{LoopCount: 1} // 1 frame
	rect := image.Rect(0, 0, mod*side, mod*side)
	img = image.NewPaletted(rect, palette)

	ls2(level, "X")

	anim.Delay = append(anim.Delay, 10)
	anim.Image = append(anim.Image, img)
	gif.EncodeAll(os.Stdout, &anim)
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
				nx, ny = cx+mod, cy
			} else if a == 1 {
				nx, ny = cx, cy-mod
			} else if a == 2 {
				nx, ny = cx-mod, cy
			} else if a == 3 {
				nx, ny = cx, cy+mod
			}

			// draw, complex in go...
			var deltax, deltay int
			if cx == nx {
				// Draw vertical line
				if ny > cy {
					deltay = 1
				} else {
					deltay = -1
				}
			} else {
				// Draw horizontal line
				if nx > cx {
					deltax = 1
				} else {
					deltax = -1
				}
			}
			for i := 0; i < mod; i++ {
				cx += deltax
				cy += deltay
				img.SetColorIndex(cx, cy, blackIndex)
			}
		}
	}
}

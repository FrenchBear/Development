// golrn01 - Learning go
// 2016-02-27	PV

package main

import "fmt"
import "math"

func main() {
	p := Point{3,4}
	d := p.Length()
	fmt.Println("Point Length =", d)
	
	origin := Point{}
	l := Line {origin, p}
	dl := l.Length()
	fmt.Println("Line Length =", dl)
	
	// Lambda quick-assigned to a variable
	average := func(x, y float64) float64 { return (x+y)/2.0 }
	m := average(4,5)
	fmt.Println("Average =", m)

	// Lambda with capture of external variable total
	var total float64 = 0
	sum := func(x float64) { total += x }
	sum(1)
	sum(2)
	sum(3)
	fmt.Println("Total =", total)
}


type Point struct { x,y float64 }

// receiver can be T or *T, does not change syntax of field access with a dot
func (p Point) Length() float64 {
	return math.Sqrt(p.x*p.x + p.y*p.y)
}

func (p *Point) Scale(factor float64) {
	p.x *= factor
	p.y *= factor
}



type Line struct { p1,p2 Point }

func (l *Line) Length() float64 {
	return math.Sqrt((l.p2.x-l.p1.x)*(l.p2.x-l.p1.x) + (l.p2.y-l.p1.y)*(l.p2.y-l.p1.y))
}
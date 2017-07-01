// golrn04 - Learning go
// Maps
//
// 2016-02-28	PV

package main

import "fmt"

func main() {
	var m1 map[string] int
	m1 = make(map[string]int, 3)
	
	m1["blue"] = 1
	m1["white"] = 2
	m1["red"] = 3
	
	fmt.Println("red:", m1["red"])
	fmt.Println("green:", m1["green"])
	
	r,e := m1["orange"]
	fmt.Println("orange ->", r, e)
	r,e = m1["blue"]
	fmt.Println("blue ->", r, e)


    s := "bonjour"	
	fmt.Println("s[1] ->", s[1])
	// s[1] = 'w'		cannot assign to s[1]
	
	var sl = s[3:]
	fmt.Println("sl ->", sl)
}

// golrn02 - Learning go
// 2016-02-27	PV

package main

import "fmt"

type T0 struct {
	x int
}

func (*T0) M0() { fmt.Println("M0") }

type T1 struct {
	y int
}

func (T1) M1() { fmt.Println("M1") }

type T2 struct {
	z int
	T1
	*T0
}

func (*T2) M2() { fmt.Println("M2") }

type Q *T2


func main() {
	var t T2
	var p *T2
	var q Q

	// Initialize pointers
	t.T0 = &T0{}
	p = &T2{}
	p.T0 = &T0{}
	q = p
	
	fmt.Println("t.T0==nil =", t.T0==nil)
	fmt.Println("p==nil =", p==nil)
	fmt.Println("q==nil =", q==nil)

	t.x = 2		// deep field
	t.y = 3		// deep field
	t.z = 4		// shallow field
	
	fmt.Println("t.x =", t.x)
	fmt.Println("t.y =", t.y)
	fmt.Println("t.z =", t.z)
	
	p.z = 1 // (*p).z
	p.y = 2 // (*p).T1.y
	p.x = 3 // (*(*p).T0).x
	
	q.x = 4 // (*(*q).T0).x 	(*q).x is a valid field selector
	p.M0() // ((*p).T0).M0() 	M0 expects *T0 receiver
	p.M1() // ((*p).T1).M1() 	M1 expects T1 receiver
	p.M2() // p.M2() 			M2 expects *T2 receiver
	t.M2() // (&t).M2() 		M2 expects *T2 receiver
	
	(*q).M0() // q.M0 is not valid
}

// golrn03 - Learning go
// Methods receivers as values or pointers
//
// 2016-02-27	PV

package main

import "fmt"

type T struct {
	a int
}

func (tv T) Mv(a int) int { fmt.Println("Mv:", a); return 0 } // value receiver

func (tp *T) Mp(f float32) float32 { fmt.Println("Mp:", f); return 1 } // pointer receiver

func makeT() T { return T{} }


func main() {
	var t T
	
	// These five invocptions are equivalent
	t.Mv(1)
	T.Mv(t, 2)	// If M is in the method set of type T, T.M is a function thpt is callable as a regular function with the same arguments as M prefixed by an additional argument thpt is the receiver of the method.
	(T).Mv(t, 3)
	f1 := T.Mv; f1(t, 4)
	f2 := (T).Mv; f2(t, 5)
	
	pt := &t
	pt.Mv(6)		// Type *T has methods of type T
	T.Mv(*pt, 7)	// T.Mv(pt, 7) is illegal
	
	f := T.Mv		// Function values derived from methods are called with function call syntax; the receiver is
	f(t, 8)			// provided as the first argument to the call. That is, given f := T.Mv, f is invoked as f(t, 8) not t.f(8)
	
	g := t.Mv		// g is a Method value
	g(9)
	
	h1 := t.Mv;  h1(11) // like t.Mv(7)
	h2 := pt.Mv; h2(12) // like (*pt).Mv(7)
	h3 := t.Mp;  h3(13) // like (&t).Mp(7)
	h4 := pt.Mp; h4(14) // like pt.Mp(7)
	//h5 := makeT().Mp // invalid: result of makeT() is not addressable

	var i interface { Mv(int) int } = t
	fi := i.Mv; fi(21) // like i.Mv(21)
	
	
	t.Mp(1)
	pt.Mp(2)
	(*T).Mp(pt, 3)	// (*T).Mp(t, 2) is illegal
	// T.Mp(pt, 4)	T.Mp undefined (type T has no method Mp)
}

// golrn07 - Learning go
// Various tests
//
// 2016-03-01	PV

package main

import "fmt"
import "math/rand"

func main() {
	// Page 51, statements
	// Empty statement

	// Expression statement
	f(8 * 7)

	// Send statement
	ch := make(chan int, 10)
	ch <- 3 // // send value 3 to channel ch
	v := <-ch
	fmt.Println(v)

	// IncDec statements
	v++
	v--

	// Assignments
	var a, b float64
	v *= 2
	a, b = f(3.14)
	_, _ = f(6.0)
	a, b = b, a // swap
	fmt.Println("a=", a, " b=", b)
	f20 := fact(20)
	fmt.Println("f20=", f20)
	goto Exit
	fmt.Println("Nothing")

	// Labeled statement
Exit:

	// Expression switch
	rand.Seed(1)
	var s string
	switch rand.Intn(4) {
	case 0:
		s = "North"
	case 1:
		s = "South"
	case 2:
		s = "East"
	case 3:
		s = "West"
	}
	fmt.Println("Go", s)

	var d = rand.Intn(4)
	switch {
		case d == 0:
			s = "Yes"
		case d == 1:
			s = "No"
		case d == 2:
		case d == 3:
			s = "Maybe"
			fallthrough
		default:
			s += "."
	}
	fmt.Println(s)

	// Type switches
	type EntierLong interface{}
	var x EntierLong = uint64(20)
	switch i := x.(type) {
		case nil:
			fmt.Println("x is nil") // type of i is type of x (interface{})
		case uint64:
			fmt.Printf("%v! = %v\n", i, fact(i)) // type of i is int
		case float64:
			fmt.Println(f(i)) // type of i is float64
		case func(int) float64:
			fmt.Println(i(3)) // type of i is func(int) float64
		case bool, string:
			fmt.Println("type is bool or string") // type of i is type of x	(interface{})
		default:
			fmt.Println("don't know the type") // type of i is type of x (interface{})
	}

	// For statement
	// as a while
	var k, l, m int = 1, 1500, 0
	for k < l {
		k *= 2
		m++
	}
	fmt.Println("log2(", l, ")~", m)

	// classical loop
	for i := uint64(0); i < 21; i++ {
		fmt.Printf("%v! = %v\n", i, fact(i)) // type of i is int
	}

	// forever loop
	for {
		if k > 1 {
			break
		}
		k <<= 2
	}

	// renge loop (for strings, range iterates over runes, not bytes)
	for _, r := range "Où ça? là!" {
		fmt.Printf("%c", r)
	}
	fmt.Println()

	return
}

func f(x float64) (float64, float64) {
	return x * x, x * x * x
}

func fact(i uint64) uint64 {
	// if statement
	if i < 2 {
		return 1
	} else {
		return i * fact(i-1)
	}
}

// golrn08 - Learning go
// Various tests
//
// 2016-03-03	PV

package main

import "fmt"

type devnull struct{}

func main() {
	// Page 60
	// Declaring an array variable automatically create the array
	// Arrays do not need to be initialized explicitly (http://blog.golang.org/go-slices-usage-and-internals)
	var a [2]int
	fmt.Println("a=", a)
	for _, s := range a {
		fmt.Println(s)
	}
	TestArray(a)		// Arrays are passed by value!
	fmt.Println("a[1]=", a[1])
	TestSlice(a[:])		// But slices by reference...
	fmt.Println("a[1]=", a[1])

	// Page 65, defer statement
	defer func() { fmt.Println("The end.") }()

	// Page 60, go statement
	const max = 1000
	primes := make(chan int, 10)
	go MakePrimes(max, primes)

	n := 0
	for p := range primes {
		n++
		fmt.Printf("%d ", p)
	}
	fmt.Println()
	fmt.Println(n, "primes up to ", max)
}

func TestArray(t [2]int) {
	t[1] = 12
}

func TestSlice(s []int) {
	s[1] = 23
}

// Send primes from 2 up to max on channel ch, then close ch
func MakePrimes(max int, ch chan int) {
	var tb []bool = make([]bool, index(max)+1)
	ch <- 2
	for p := 3; p <= max; p += 2 {
		i := index(p)
		if tb[i] == false {
			ch <- p
			for q := p + p + p; q <= max; q += p + p {
				tb[index(q)] = true
			}
		}
	}
	close(ch)
}

func index(i int) int {
	return (i - 1) >> 1
}

// Page 63, a receiver can be anonymous (just a type, here devnull)
func (devnull) Write(p []byte) (n int, _ error) {
	n = len(p)
	return
}

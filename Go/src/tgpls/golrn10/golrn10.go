// golrn10 - Learning go
// append()
//
// 2016-03-11	PV

package main

import "fmt"
import "time"
import "strconv"

func main() {
	a1 := [...]int{1,2,3}	// array
	a2 := append(a1[:],4)	// 1st argument of append must be a lice, can't be [3]int
	
	b1 := []int{1,2,3}		// slice
	b2 := append(b1,4)
	
	fmt.Println("a1=", a1)
	fmt.Println("a2=", a2)
	fmt.Println("b1=", b1)
	fmt.Println("b2=", b2)
	
	testAppend(100000)
	testAppend(1000000)
	testAppend(10000000)
	testAppend(100000000)
	
	// Output:
	// append 100000 items took 2.4995ms
	// append 1000000 items took 17.5607ms
	// append 10000000 items took 140.5103ms
	// append 100000000 items took 1.2176934s
	// So it's really linear execution time...
	
	fmt.Println(reverse("Terminated"))
}

func testAppend(n int) {
	var s string = "append " + strconv.Itoa(n) + " items"
	defer timeTrack(time.Now(), s)
	l := []int{}
	for i:=0 ; i<n ; i++ {
		l = append(l, i)
	}
}

func timeTrack(start time.Time, name string) {
    elapsed := time.Since(start)
    fmt.Printf("%s took %s\n", name, elapsed)
}

// Can't use a string receiver: cannot define new methods on non-local type string
func reverse(s string) string {
	t := ""
	for _,r:=range(s) {
		t = string(r)+t
	}
	return t
}

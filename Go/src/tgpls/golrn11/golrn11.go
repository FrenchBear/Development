// golrn11 - Learning go
// panic and recover
//
// 2016-03-18	PV

package main

import "fmt"
import "log"
import "errors"			// http://blog.golang.org/error-handling-and-go

func main() {
	protect(toDo)

	r := f1(10)
	fmt.Println("r=", r)
	r = f1_OnErrorResumeNext(0)
	fmt.Println("r=", r)
	r = f1_OnErrorResumeNext(20)
	fmt.Println("r=", r)
}

func f1_OnErrorResumeNext(n int) (result int) {
	defer func() { 
		recover()
		result = 42		// use named return value to force value returned in panic
	} ()
	return f1(n)
}

func f1(n int) int {
	defer func() { fmt.Printf("End of f1(%d)\n", n) } ()
	return f2(n)
}

func f2(n int) int {
	defer func() { fmt.Printf("End of f2(%d)\n", n) } ()
	return f3(n)
}

func f3 (n int) int {
	var d int = 100 / n
	return d
}

func toDo() {
	panic(errors.New("Not implemented yet."))
}

func protect(g func()) {
	defer func() {
		log.Println("done") // Println executes normally even if there is a panic
		if x := recover(); x != nil {
			log.Printf("run time panic: %v", x)
		}
	} ()
	log.Println("start")
	g()
}

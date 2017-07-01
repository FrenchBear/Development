// golrn09 - Learning go
// byte[], string, rune...
// http://stackoverflow.com/questions/12668681/how-to-get-the-number-of-characters-in-a-string
// https://blog.golang.org/strings
// http://www.joelonsoftware.com/articles/Unicode.html
//
// 2016-03-03	PV

package main

import "fmt"
import "golang.org/x/text/unicode/norm"

func main() {
	Analyze("ecole")
	Analyze("école")	// here é = U+00e9
	Analyze("école")	// here é = e + U+0301
	Analyze("x̄ and σ")	// here x = x + U+0304
}

func Analyze(s string) {
	fmt.Printf("\n%s\n", s)
	
	fmt.Printf("  %d bytes:", len(s))
	for i:=0 ; i<len(s) ; i++ {
		fmt.Printf(" %02x", s[i])
	}
	fmt.Println()

	fmt.Printf("  %d runes:", len([]rune(s)))
	for _,r := range s {
		fmt.Printf(" %x", r)
	}
	fmt.Println()
	
	// Normalise to compact form
	// https://godoc.org/golang.org/x/text/unicode/norm
	// 
	var ia norm.Iter
    ia.InitString(norm.NFC, s)
	nc := 0
	for !ia.Done() {
		nc++
		r := []rune(ia.Next())[0]
		fmt.Printf(" %x", r)
	}
	fmt.Printf("  %d runes once normalized NFC\n", nc)
}
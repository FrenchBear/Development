// golrn06 - Learning go
// Various tests
//
// 2016-03-01	PV

package main

import "fmt"

func main() {
	// Page 39
	value := "hello, world"
	value = "\u00f8"
	v1, v2 := Split(value, len(value)/2)
	fmt.Println("value=", value, " v1=", v1, " v2=", v2)
	if Join(Split(value, len(value)/2)) != value {
		fmt.Println("test fails")
	}

	// Page 41
	var s uint = 33
	var i = 1 << s         // 1 has type int
	var j int32 = 1 << s   // 1 has type int32; j == 0
	var k = uint64(1 << s) // 1 has type uint64; k == 1<<33
	var m int = 1.0 << s   // 1.0 has type int
	var n = 1.0<<s != i    // 1.0 has type int; n == false if ints are 32bits in size
	var o = 1<<s == 2<<s   // 1 and 2 have type int; o == true if ints are 32bits in size
	var p = 1<<s == 1<<33  // illegal if ints are 32bits in size: 1 has type int, but 1<<33 overflows int
	//	var u = 1.0<<s // illegal: 1.0 has type float64, cannot shift
	//	var u1 = 1.0<<s != 0 // illegal: 1.0 has type float64, cannot shift
	//	var u2 = 1<<s != 1.0 // illegal: 1 has type float64, cannot shift
	//	var v float32 = 1<<s // illegal: 1 has type float32, cannot shift
	var w int64 = 1.0 << 33 // 1.0<<33 is a constant shift expression
	fmt.Println("i=", i)
	fmt.Println("j=", j)
	fmt.Println("k=", k)
	fmt.Println("m=", m)
	fmt.Println("n=", n)
	fmt.Println("o=", o)
	fmt.Println("p=", p)
	fmt.Println("w=", w)

	// Page 42
	mi := 0x55 &^ 0xF // And Not, clears the last 4 bits
	fmt.Printf("mi=0x%x\n", mi)
	// Page 43
	var i16 int16 = 32767
	var b1 = i16 < i16+1 // false!
	fmt.Println("b1=", b1)

	s1 := "État de siège à Katmandou"                   // 3 accents sont non normalisés					//
	s2 := "État de siège à Katmandou"                      // normalisés
	fmt.Println("len(s1)=", len(s1), " len(s2)=", len(s2)) // 31 et 28

	// Page 45
	var ni int = *pf(&mi)
	fmt.Printf("ni=0x%x\n", ni)

	// Page 46
	var s3 = string(0x266c) // "♬" of type stringa
	fmt.Println("s3=", s3, len(s3))
	var s4 = string(0xf8) // "\u00f8" == "ø" == "\xc3\xb8"
	fmt.Println("s4=", s4, len(s4))
	var s5 = string([]rune{'H', 0xf8})
	fmt.Println("s5=", s5, len(s5), len(([]rune)(s5)))
	var tr = []rune("Où ça? là!")
	for _, rl := range tr {
		fmt.Printf("%c ", rl)
	}
	fmt.Println()
	var ip *int = (*int)(nil)
	fmt.Println("ip=", ip)

	// Page 49
	const Huge = 1 << 100
	var fh = float64(Huge)
	//fmt.Println("Huge=", Huge)		constant 1267650600228229401496703205376 overflows int
	fmt.Println("fh=", fh)

}

func Split(s string, pos int) (string, string) {
	return s[0:pos], s[pos:]
}

func Join(s, t string) string {
	return s + t
}

func pf(pi *int) *int {
	return pi
}

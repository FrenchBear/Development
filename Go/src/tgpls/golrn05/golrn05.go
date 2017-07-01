// golrn05 - Learning go
// Types assertions
//
// 2016-02-28	PV

package main

import "fmt"

type IAnimal interface {
	Manger()
	Dormir()
	Crier()
}

type Chien struct {
	Nom string
}

func (c Chien) Manger() {
}

func (c Chien) Dormir() {
}

func (c Chien) Crier() {
	fmt.Println("Ouah")
}


type Chat struct {
	Nom string
}

func (c Chat) Manger() {
}

func (c Chat) Dormir() {
}

func (c Chat) Crier() {
	fmt.Println("Miaou")
}


type Cheval struct {
	Nom string
}

func (c Cheval) Manger() {
}

// Dormir is not implemented

func (c Cheval) Crier() {
	fmt.Println("Miaou")
}


// Compiler_check that type Chien and Chat implement IAnimal interface
var _ IAnimal = (*Chien)(nil)
var _ IAnimal = (*Chat)(nil)
// var _ IAnimal = (*Cheval)(nil)		Fails: *Cheval does not implement IAnimal (missing Dormir method)


func main() {
	var ia IAnimal			// Contains nil
	var v, ok = ia.(Chien)
	fmt.Println(v, ok)
	
	// Test if an interface is a given type
	ia = Chien {"Medor"}	// Ok since Chien implements IAnimal
	v, ok = ia.(Chien)
	fmt.Println(v, ok)		// v is a Chien and ok is true
	v.Crier()

	ia = Chat {"Kitty"}
	v, ok = ia.(Chien)
	fmt.Println(v, ok)
	w, ok := ia.(Chat)
	fmt.Println(w, ok)
	w.Crier()
	
	// Tell at run-time if a value implements an interface
	jj := Cheval{"Jolly Jumper"}
	var i interface{} = jj
	_, ok = i.(IAnimal)
	fmt.Println("jj implements IAnimal:", ok)		// false
	hk := Chat{"Hello Kitty"}
	i = hk
	_, ok = i.(IAnimal)
	fmt.Println("hk implements IAnimal:", ok)		// true
	phk := &hk
	i = phk
	_, ok = i.(IAnimal)
	fmt.Println("phk implements IAnimal:", ok)		// true
}

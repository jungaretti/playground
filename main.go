package main

import (
	"encoding/json"
	"fmt"
)

type A struct {
	Breakfast string
	Lunch     string
}

type B struct {
	Dinner string
}

type C struct {
	A
	B
}

func main() {
	a := A{
		Breakfast: "eggs",
		Lunch:     "tacos",
	}
	b := B{
		Dinner: "pasta",
	}

	c := C{
		A: a,
		B: b,
	}

	fmt.Println(c.Breakfast)

	enc, _ := json.Marshal(c)
	fmt.Printf("%s\n", enc)
}

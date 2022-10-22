package main

import (
	"encoding/json"
	"fmt"
)

type person struct {
	Name string `json:"namee"`
	Age  int
}

func main() {
	jsn := `[
		{
			"namee": "Abderrahim",
			"age": 23
		},
		{
			"namee": "Abdelali",
			"age": 23
		},
		{
			"namee": "Abdellah",
			"age": 21
		}
	]`

	lstprs := []person{}

	json.Unmarshal([]byte(jsn), &lstprs)

	fmt.Println(lstprs)

	fmt.Println([]struct {
		name string
		age  int
	}{
		struct {
			name string
			age  int
		}{"sdfsd", 585},
	})
}

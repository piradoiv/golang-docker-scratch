package main

import (
	"io"
	"net/http"
)

func hello(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello, World!")
}

func main() {
	println("http://localhost:8000/")
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8000", nil)
}

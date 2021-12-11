package main

import (
	"fmt"
	"net/http"
)

var response string

func main() {
	http.HandleFunc("/version", version)
	http.ListenAndServe(":3000", nil)
}

func version(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, response)
}

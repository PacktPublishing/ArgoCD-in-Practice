package main

import (
	"fmt"
	"net/http"
)

var BuildVersion = "v0.0"

func main() {
	http.HandleFunc("/version", version)
	http.ListenAndServe(":3000", nil) //nolint
}

func version(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, BuildVersion)
}

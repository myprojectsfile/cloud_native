package main

import (
	"cloud_native_go_api"
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", index)

	http.HandleFunc("/api/books", cloud_native_go_api.BooksHandleFunc)
	http.HandleFunc("/api/books/", cloud_native_go_api.BookHandleFunc)

	http.ListenAndServe(port(), nil)
}

func port() string {
	port := os.Getenv("CNATIVE_PORT")
	if len(port) == 0 {
		port = "9090"
	}
	return ":" + port
}

func index(res http.ResponseWriter, req *http.Request) {
	res.WriteHeader(http.StatusOK)
	fmt.Fprintf(res, "Welcome to Cloud Native Go (Update).")
}

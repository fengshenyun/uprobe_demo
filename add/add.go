// add.go
package main

import (
	"time"
	"fmt"
	"os"
)

//go:noinline
func Add(a, b int) int {
	return a+b
}

func main() {
	for i := 0; i < 10000; i++ {
		res := Add(i, i+1)
		pid := os.Getpid()
		fmt.Printf("res:%v, pid:%v, ppid:%v\n", res, pid, os.Getppid())
		time.Sleep(time.Second)
	}
}

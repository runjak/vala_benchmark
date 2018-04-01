package main

import (
	"time"
	//"golang.org/x/exp/rand"
	"fmt"
	"math/rand"
)

func main() {
	start := time.Now()
	rnd := rand.New(rand.NewSource(time.Now().UnixNano()))
	var x, y, d float64
	var i uint64

	n := 1000000

	for k := 0; k < n; k++ {
		x = rnd.Float64()
		y = rnd.Float64()
		d = x*x + y*y
		if d <= 1 {
			i++
		}
	}

	π := float64(i) / float64(n) * float64(4)

	fmt.Printf("PI is: %f\n", π)
	fmt.Printf("ended after %v\n", time.Since(start))
}

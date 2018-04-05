package main

import (
	"time"
	//"golang.org/x/exp/rand"
	"fmt"
	"math/rand"
	"sync"
	"sync/atomic"
)

func main() {
	start := time.Now()
	var wg sync.WaitGroup

	var i uint64
	n := 100000

	for j := 0; j < 10; j++ {
		wg.Add(1)
		rnd := rand.New(rand.NewSource(time.Now().UnixNano()))
		go func() {
			defer wg.Done()
			var x, y, d float64
			for k := 0; k < n; k++ {
				x = rnd.Float64()
				y = rnd.Float64()
				d = x*x + y*y
				if d <= 1 {
					atomic.AddUint64(&i, 1)
				}
			}
		}()
	}

	wg.Wait()

	π := float64(i) / float64(n*10) * float64(4)

	fmt.Printf("PI is: %f\n", π)
	fmt.Printf("ended after %v\n", time.Since(start))
}

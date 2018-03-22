import time
import random

def quicksort(l, lo, hi):
    if lo < hi:
        p = partition(l, lo, hi)
        quicksort(l, lo, p - 1)
        quicksort(l, p + 1, hi)

def partition(l, lo, hi):
    pivot = l[hi]
    i = lo - 1
    for j in range (lo, hi):
        if l[j] < pivot:
            i += 1
            l[i], l[j] = l[j], l[i]
    l[i+1], l[hi] = l[hi], l[i+1]
    return i + 1

if __name__ == "__main__":
    q = 1000000
    vals = [random.randint(0,q) for _ in range(0,q)]
    start = time.time()
    quicksort (vals, 0, len(vals) - 1)
    print ("ended after {}", time.time() - start)
#    print (vals)

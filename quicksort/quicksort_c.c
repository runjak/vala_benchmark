#include <stdio.h>
#include <time.h>
#include<sys/time.h>
#include <stdlib.h>

void swap(int* a, int* b) {
    int t = *a;
    *a = *b;
    *b = t;
}

int partition(int l[], int lo, int hi) {
    int pivot = l[hi];
    int tmp;
    int i = lo - 1;
    for (int j = lo; j < hi; j++) {
        if (l[j] < pivot) {
            i++;
            swap(&l[i], &l[j]);
        }
    }
    swap(&l[hi], &l[i+1]);
    return i + 1;
}

void quicksort(int l[], int lo, int hi) {
    if (lo < hi) {
        int p = partition(l, lo, hi);
        quicksort(l, lo, p-1);
        quicksort(l, p+1, hi);
    }
}

void main() {
    srand(time(NULL));

    int q = 1000000;
    int l[q];

    for (int i = 0; i < q; i++) {
        l[i] = random() % q;
    }

    struct timeval start;
    gettimeofday(&start, NULL);
    long starttime = start.tv_sec * (int)1e6 + start.tv_usec;

    quicksort(l, 0, q-1);
    
    gettimeofday(&start, NULL);
    long endtime = start.tv_sec * (int)1e6 + start.tv_usec;
    printf("ended after: %i\n", endtime - starttime);
    /*for (int i = 0; i < q; i++) {
        printf("%i ",l[i]);
    }*/
}

/*
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
    q = 10000000
    vals = [random.randint(0,q) for _ in range(0,q)]
    start = time.time()
    quicksort (vals, 0, len(vals) - 1)
    print ("ended after {}", time.time() - start)
    print (vals)
*/

void quicksort(ref int[] l, int lo, int hi) {
    if (lo < hi) {
        var p = partition(ref l, lo, hi);
        quicksort(ref l, lo, p - 1);
        quicksort(ref l, p + 1, hi);
    }
}

int partition(ref int[] l, int lo, int hi) {
    var pivot = l[hi];
    var tmp = 0;
    var i = lo - 1;
    for (int j = lo; j < hi; j++) {
        if (l[j] < pivot) {
            i++;
            tmp = l[j];
            l[j] = l[i];
            l[i] = tmp;
        }
    }
    tmp = l[hi];
    l[hi] = l[i+1];
    l[i+1] = tmp;
    return i+1;
}

static void main() {
    var q = 1000000;
    var vals = new int[q];
    for (int i = 0; i < q; i++) {
        vals[i] = Random.int_range(0,q);
    }
    var start = new DateTime.now_local();
    quicksort(ref vals, 0, vals.length);
    stdout.printf("ended after: %s\n", (
        (new DateTime.now_local()).difference(start)).to_string()
    );
    /*for (int i = 0; i < q; i++) {
        vals[i] = Random.int_range(0,q);
    }*/
}

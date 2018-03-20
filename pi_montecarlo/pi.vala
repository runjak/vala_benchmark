public static void main() {
    var start = new DateTime.now_local();
    uint i = 0;
    uint o = 0;
    for (int n = 0; n < 1000000; n++) {
        double x = Random.next_double();
        double y = Random.next_double();
        double d = Math.sqrt( Math.pow(x, 2) + Math.pow(y,2) );
        if (d > 1.0d)
            o++;
        else
            i++;
    }
    stdout.printf("PI is: %f\n", (double)i/(double)o);
    stdout.printf("ended after: %s\n", (
        (new DateTime.now_local()).difference(start)).to_string()
    );
}

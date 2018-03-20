#include<stdio.h>
#include<time.h>
#include<sys/time.h>
#include<stdlib.h>
#include<math.h>

void main() {
    srand(time(NULL));
    struct timeval start;
    gettimeofday(&start, NULL);
    long starttime = start.tv_sec * (int)1e6 + start.tv_usec;
    int i = 0;
    int o = 0;
    for (int n = 0; n < 1000000; n++) {
        double x = (double)rand()/RAND_MAX;
        double y = (double)rand()/RAND_MAX;
        double d = sqrt( pow(x,2) + pow(y,2) );
        if (d > 1.0) {
            o++;
        } else {
            i++;
        }
    }
    printf("PI is: %f\n", (double)o/(double)i);
    gettimeofday(&start, NULL);
    long endtime = start.tv_sec * (int)1e6 + start.tv_usec;
    printf("ended after: %i\n", endtime - starttime);
}

import math
import time
import random

def run():
    start = time.time()
    i = 0
    o = 0
    for _ in range(1000000):
        x = random.random()
        y = random.random()
        d = math.sqrt( x**2 + y**2 )
        if d > 1:
            o += 1
        else:
            i += 1
    print ("PI is: {}".format(i/o))
    print ("ended after {}", time.time() - start)
    start = time.time()
        
if __name__ == "__main__":
    run()

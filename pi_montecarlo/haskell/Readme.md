Build and run instructions
===

This software was programmed for GHC 8.2.2 to be build with cabal 2.0.0.1.
So you'll need both these tools to compile the software yourself ;)

To build run:
```bash
cabal configure
cabal build
```

This should leave you with a compiled binary in `./dist/build/pi-montecarlo/pi-montecarlo`.
To benchmark run it using `time ./dist/build/pi-montecarlo/pi-montecarlo`.

It makes sense to use `time` here for two reasons:
1. Measurements performed by the program itself may easily skew for several reasons (for example because of OS scheduling).
2. Lazy evaluation makes it harder to measure the (lazy) calculation itself, but printing the result forces calculation of the result.

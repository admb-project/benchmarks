# Benchmark: ADMB 12.3 vs 13.0-beta

Two modern laptops, Lenovo P15 Gen 1 (i7-10875H) and Dell Precision 3560
(i7-1165G7), each with a number of VMs. ADMB built from the current
[admb-13.0](https://github.com/admb-project/admb/tree/admb-13.0) branch (commit
8820af06) with `make -j8`. The
[example](https://github.com/admb-project/admb/tree/main/examples/admb) models
(catage and vol) are built using `admb -f` and then run as `catage -mcmc 1e6
-mcsave 1e3` and `nm2vol`.

The [analysis](analysis.R) of the [results](results.csv) indicates that for
these examples, ADMB 13.0-beta is consistently and considerably slower than ADMB
12.3, around 20% slower in Linux and around 60% slower in Windows. See
[plot](plot.pdf).

One would hope that ADMB 13.0 will be equally fast as previous versions - or at
least not much slower.

This seems worth looking into before releasing 13.0.

---

*Edit:*

Link to recent [SS3
benchmarks](https://github.com/nmfs-stock-synthesis/stock-synthesis/issues/257#issuecomment-1125039928).

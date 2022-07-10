# Benchmark: ADMB 12.3 vs 13.0-beta

## 16 May 2022

Two modern laptops, Lenovo P15 Gen 1 (i7-10875H) and Dell Precision 3560
(i7-1165G7), each with a number of VMs. ADMB built from the [12.3
source](https://github.com/admb-project/admb/releases/download/admb-12.3/admb-12.3-src.zip)
and from the current
[admb-13.0](https://github.com/admb-project/admb/tree/admb-13.0) branch (commit
8820af06) with `make -j8`. The
[example](https://github.com/admb-project/admb/tree/main/examples/admb) models
(catage and vol) are built using `admb -f` and then run as `catage -mcmc 1e6
-mcsave 1e3` and `nm2vol`.

The [analysis](2022_05_16/analysis.R) of the [results](2022_05_16/results.csv)
indicates that for these examples, ADMB 13.0-beta is consistently and
considerably slower than ADMB 12.3, around 20% slower in Linux and around 60%
slower in Windows. See [plot](2022_05_16/plot.pdf).

One would hope that ADMB 13.0 will be equally fast as previous versions - or at
least not much slower.

This seems worth looking into before releasing 13.0.

Related: Link to recent [SS3
benchmarks](https://github.com/nmfs-stock-synthesis/stock-synthesis/issues/257#issuecomment-1125039928).

---

## 10 Jul 2022

Revisiting the benchmark, building ADMB from the
[admb-13.0](https://github.com/admb-project/admb/tree/admb-13.0) branch (commit
f6721274).

The [analysis](2022_07_10/analysis.R) of the July
[results](2022_07_10/results.csv) indicates that for these examples, ADMB
13.0-beta still has a performance problem in Windows. See
[plot](2022_07_10/plot.pdf).

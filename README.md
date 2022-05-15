# Benchmark: ADMB 12.3 vs 13.0-beta

Two modern laptops, Lenovo P15 Gen 1 (i7-10875H) and Dell Precision 3560
(i7-1165G7), each with a number of VMs. ADMB built from the current
[admb-13.0](https://github.com/admb-project/admb/tree/admb-13.0) branch
(8820af06), compiling models using `admb -f`. The tests (catage and vol) are
from
[admb/examples](https://github.com/admb-project/admb/tree/main/examples/admb):
`catage -mcmc 1e6 -mcsave 1e3` and `nm2vol`.

The [analysis](analysis.R) of the [results](results.csv) indicates that ADMB
12.3 is 35% faster than ADMB 13.0-beta.

This is worth looking into before releasing 13.0.

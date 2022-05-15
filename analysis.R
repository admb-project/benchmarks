library(lattice)

## 1  Calculate relative difference

x <- read.csv("results.csv")

x <- x[order(x$Machine, x$OS, x$Test, x$ADMB),]
x$GCC <- NULL

v12 <- x$Runtime[x$ADMB == "12.3"]
v13 <- x$Runtime[x$ADMB == "13.0-beta"]

rel <- v13 / v12

print(median(rel))

## 2  Combine groups and plot

x$Platform <- "Linux"
x$Platform[grep("Windows", x$OS)] <- "Windows"

y <- aggregate(Runtime ~ Platform + Test + ADMB, data=x, median)

barchart(Runtime ~ Test | Platform, groups=ADMB, data=y, col=3:2)

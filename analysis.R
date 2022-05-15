library(lattice)

## 1  Read data

x <- read.csv("results.csv")

## 2  Combine platforms

x$Platform <- "Linux"
x$Platform[grep("Windows", x$OS)] <- "Windows"
y <- aggregate(Runtime ~ Platform + Test + ADMB, data=x, median)

## 3  Calculate relative difference

z <- xtabs(Runtime~paste(Test, "-", Platform) + ADMB, data=y)
z <- as.data.frame(unclass(z))
z$rel <- z$"13.0-beta" / z$"12.3"

## 4  Plot

barchart(Runtime ~ Test | Platform, groups=ADMB, data=y, col=3:2)

library(lattice)

## Read data, set up graphical device
x <- read.csv("results.csv")
pdf("plot.pdf", width=16, height=10)

## Detailed comparison
col <- c(3, 2, 7)
sub <- "Green = ADMB 12.3
Red = ADMB 13.0-beta (May)
Yellow = ADMB 13.0-beta (July)"
x <- x[order(x$Machine, x$OS, x$Test, x$ADMB),]
x <- x[c("Machine", "OS", "Test", "ADMB", "Runtime")]
xplot <- barchart(Runtime ~ Test | Machine + OS, groups=ADMB, data=x, col=col,
                  main="Detailed comparison", ylab="Runtime (sec)", sub=sub)

## Grouped comparison
x$Platform <- "Linux"
x$Platform[grep("Windows", x$OS)] <- "Windows"
geomean <- function(x) exp(mean(log(x)))
y <- aggregate(Runtime ~ ADMB + Platform + Test, data=x, geomean)
yplot <- barchart(Runtime ~ Test | Platform, groups=ADMB, data=y, col=col,
                  main="Grouped comparison", ylab="Runtime (sec)", sub=sub)

## Export plots
print(xplot, position=c(0.00, 0.05, 0.35, 0.95), more=TRUE)
print(yplot, position=c(0.35, 0.05, 1.00, 0.95))
dev.off()

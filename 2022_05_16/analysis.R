library(lattice)

## Read data, set up graphical device
x <- read.csv("results.csv")
pdf("plot.pdf", width=16, height=10)

## Detailed comparison
col <- 3:2
x <- x[order(x$Machine, x$OS, x$Test, x$ADMB),]
x <- x[c("Machine", "OS", "Test", "ADMB", "Runtime")]
xplot <- barchart(Runtime ~ Test | Machine + OS, groups=ADMB, data=x, col=col,
                  main="Detailed comparison", ylab="Runtime (sec)",
                  sub="Green = ADMB 12.3\nRed = ADMB 13.0-beta (May)")

## Grouped comparison
x$Platform <- "Linux"
x$Platform[grep("Windows", x$OS)] <- "Windows"
y <- aggregate(Runtime ~ ADMB + Platform + Test, data=x, median)
yplot <- barchart(Runtime ~ Test | Platform, groups=ADMB, data=y, col=col,
                  main="Grouped comparison", ylab="Runtime (sec)",
                  sub="Green = ADMB 12.3\nRed = ADMB 13.0-beta (May)")

## Export plots
print(xplot, position=c(0.00, 0.05, 0.35, 0.95), more=TRUE)
print(yplot, position=c(0.35, 0.05, 1.00, 0.95))
dev.off()

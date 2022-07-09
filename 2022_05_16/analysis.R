library(lattice)

## Read data, set up graphical device

x <- read.csv("results.csv")
pdf("plot.pdf", width=16, height=10)

## Detailed comparison

x <- x[order(x$Machine, x$OS, x$Test, x$ADMB),]
x <- x[c("Machine", "OS", "Test", "ADMB", "Runtime")]
xrel <- x$Runtime[x$ADMB == "12.3"] / x$Runtime[x$ADMB == "13.0-beta"]
round(sort(xrel), 2)
xplot <- barchart(Runtime ~ Test | Machine + OS, groups=ADMB, data=x, col=3:2,
                  main="Detailed comparison", ylab="Runtime (sec)",
                  sub="Green = ADMB 12.3\nRed = ADMB 13.0-beta")

## Grouped comparison

x$Platform <- "Linux"
x$Platform[grep("Windows", x$OS)] <- "Windows"
y <- aggregate(Runtime ~ ADMB + Platform + Test, data=x, median)
yrel <- y$Runtime[y$ADMB == "12.3"] / y$Runtime[y$ADMB == "13.0-beta"]
round(sort(yrel), 2)
yplot <- barchart(Runtime ~ Test | Platform, groups=ADMB, data=y, col=3:2,
                  main="Grouped comparison", ylab="Runtime (sec)",
                  sub="Green = ADMB 12.3\nRed = ADMB 13.0-beta")

## Export plots

print(xplot, position=c(0.00, 0.05, 0.35, 0.95), more=TRUE)
print(yplot, position=c(0.35, 0.05, 1.00, 0.95))
dev.off()

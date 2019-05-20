setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 3/Video 3.1")
#=======================================================
# examples 
#=======================================================
set.seed(7289)
x <- seq(1, 12)
y <- rnorm(12, 10)

# To create a scatterplot
plot(x, y)
plot(x, y, type="b")
plot(x, y, type="b", col="blue")
plot(x, y, type="b", pch=3, col="blue")
plot(x, y, type="b", pch=23, col="blue")
plot(x, y, type="b", pch=23, col="blue", bg="red")

# To add labels
plot(x, y, type="b", pch=23, col="blue", bg="red", main="Plot Example Video 3.1")
plot(x, y, type="b", pch=23, col="blue", bg="red", main="Plot Example Video 3.1", xlab="x values", ylab="simulated y values")

# To create an histogram
hist(y, freq=FALSE) 
hist(y, freq=TRUE) # showing frequency
 
# Add labels and colors
hist(y, freq=TRUE, col="orange")  
hist(y, freq=TRUE, col="orange", border="red")
hist(y, freq=TRUE, col="orange", border="red", labels=TRUE)
hist(y, freq=TRUE, col="orange", border="red", labels=TRUE, main="hist() example")

# To change x and y limits
hist(y, ylim=c(0, 5), freq=TRUE, col="orange", border="red", labels=TRUE)
hist(y, xlim=c(7, 13), ylim=c(0, 5), freq=TRUE, col="orange", border="red", labels=TRUE)

# To plot expressions i.e. mathematical functions
# e.g. cos(x) from 0 to 8 pi
curve(expr=cos(x), from=0, to=8*pi)
curve(expr=cos(x), from=0, to=8*pi, main="f(x) = cos(x)", col="purple")
curve(expr=cos(x), from=0, to=8*pi, main="f(x) = cos(x)", col="purple", lwd=3)

# Working with vectors
set.seed(21590)
height <- rnorm(12, mean=150, sd=10)
group <- sample(c("A", "B"), 12, replace=TRUE)

# To create a barplot
set.seed(21590)
mypalette <- sample(colors(distinct=TRUE), 12)

barplot(height, col=mypalette, names.arg=group)
barplot(height, col=mypalette, names.arg=group, las=2)
barplot(height, col=mypalette, cex.names=0.7, names.arg=group, las=2, ylab="height in cm")

# To create a boxplot
df <- data.frame(height, group)
boxplot(height ~ group, data=df, col=c("blue", "red"))
boxplot(height ~ group, main="Boxplot example", ylab="height", data=df, col=c("blue", "red"))

# To save images
png(filename="Barplot_example3.1.png", width=12, height=8, units = 'in', res = 300)
barplot(height, col=mypalette, cex.lab=1.8, cex.axis=1.2, cex.names=1.7, names.arg=group, las=2, ylab="height in cm")
graphics.off()

png(filename="Boxplot_example3.1.png", width=6, height=6, units = 'in', res = 300)
boxplot(height ~ group, main="Boxplot example", ylab="height", data=df, col=c("blue", "red"))
graphics.off()


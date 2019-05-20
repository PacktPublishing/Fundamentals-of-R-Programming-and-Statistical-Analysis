# Plotting and working with probability distributions
rnorm(10, 2, sd=5)
rpois(7, lambda=4)
rbinom(7, 12, prob=0.5)

# Example to plot a normal curve with
# mean = 7.5
# sd = 1.5

x <- seq(0, 16, length=100)
nd.height <- dnorm(x, mean = 7.5, sd = 1.5)
plot(x, nd.height, type = "l", xlab = "Liters per day",  ylab = "Density", main = "water drank by school children < 12 years old") 

pnorm(4, mean = 7.5, sd = 1.5, lower.tail = TRUE)

qnorm(0.65, mean=7.5, sd=1.5)
qnorm(0.5, mean=7.5, sd=1.5)
qnorm(0.95, mean=7.5, sd=1.5)

#Plotting cumulative probabilty
ld.cdf <- pnorm(x, mean = 7.5, sd = 1.5, lower.tail = TRUE)
plot(x, ld.cdf, type = "l", xlab = " Liters per day ", ylab = "Cumulative Probability")

plot(x, nd.height, type = "l", xlab = "Liters per day",  ylab = "Density")

# Highlight 95th percentile 

ld.lower <- 9.97 # qnorm(0.95, mean=7.5, sd=1.5)
ld.upper <- 16
i <- x >= ld.lower & x <= ld.upper #returns a logical vector
polygon(c(ld.lower,x[i], ld.upper), c(0, nd.height [i],0), col="red")
abline(h = 0, col = "gray")

pnorm(9.97, mean = 7.5, sd = 1.5, lower.tail = FALSE)



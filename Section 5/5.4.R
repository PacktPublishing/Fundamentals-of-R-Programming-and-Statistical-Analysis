library("propagate")

# The fitDistr() function allows you to use a vector of observation 
#or an object generated using the propagate() function.

set.seed(275) 
observations <- rnorm(10000, 5)
distTested <- fitDistr(observations)

# For the AIC value
distTested$aic

# you can use the fitDistr() function to fit results 
# obtained from the propagate() function. 
 x <- c(6, 0.1)
 y <- c(2, 0.1)
 DF <- cbind(x, y)
 EXPR <- expression(x^(3 * y)-1)
 RES <- propagate(expr = EXPR, data = DF, type = "stat", do.sim = TRUE, verbose = TRUE)
 testedDistrEXPR <- fitDistr(RES)
testedDistrEXPR$aic


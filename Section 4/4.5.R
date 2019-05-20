# EXAMPLE 1
getMeanPlus2 <- function(x){
  y <- mean(x) +2
  return(y)
}

x1 <- 1:4
getMeanPlus2(x1)

x2 <- c(2, 6, 8, NA)
getMeanPlus2(x2, na.rm=TRUE)

# FUNCTION WITH BUG
getMeanPlus2 <- function(x, na.rm=TRUE){
  y <- mean(x, trim=na.rm) +2
  return(y)
}

traceback()

# Correct the function
getMeanPlus2 <- function(x, ...){
  y <- mean(x, ...) +2
  return(y)
}
getMeanPlus2(x2, na.rm=TRUE)

# EXAMPLE 2
getResults <- function(x, ...){
  y1 <- rep(x, 4)
  y <- y1/2
  res <- mean(y, ...)
  return(res)
}

getResults(x1)
getResults(x2)

debug(getResults)
getResults(x2, na.rm=TRUE)

undebug(getResults)
getResults(x2, na.rm=TRUE)


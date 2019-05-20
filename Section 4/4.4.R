# Creating your own functions
genes <- c("MED18", "KCNE1", "CYP11B2", "TFAP4", "UBA52")
values <- rnorm(5, mean=4, sd=5)
df <- data.frame(genes, values)
df2 <- data.frame(genes, values=rnorm(5, mean=5, sd=3))

# calculate the mean expression values
getmeanExprsValues <- function(expdf){
  meanexprs <- mean(expdf$values)
  return(meanexprs)
}

dflist <- list(A=df, B=df2)
for(i in 1:2){
  res <- getmeanExprsValues(dflist[[i]])
  print(res)
}

getmeanExprsValues(df)
getmeanExprsValues(df2)

sapply(dflist, getmeanExprsValues)

# Returns the mean for df using columnUse to define where the values are stored
getmeanExprsValuesII <- function(expdf, columUse=2){
  meanexprs <- mean(expdf[, columUse])
  return(meanexprs)
}

getmeanExprsValuesII(df)
df <- cbind(df, values2=rnorm(5, 4, 6))
getmeanExprsValuesII(df, columUse=3)

# Function to calculate mean with three-dots for mean()
getmeanExprsValuesIII <- function(expdf, columUse=2, ...){
  meanexprs <- mean(expdf[, columUse], ...)
  return(meanexprs)
}

getmeanExprsValuesIII(df, columUse=3, na.rm=TRUE)

df[2, 2] <- NA
getmeanExprsValuesIII(df, columUse=2, na.rm=TRUE)









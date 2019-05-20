# setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.4")
#================================================
# Basics of the sapply() function 
#================================================
 # Using the apply() function
 x <- rep(c(12, 5, 8, 25, 17), 3)
 x
 # Create a matrix with x 
 mat1 <- matrix(x, nrow=3)
 
 # Use the apply function to get the sum of each row
 apply(mat1, 1, sum)

 # Use the apply function to get the sum of each column
 apply(mat1, 2, sum)
 
 # Add 2 to each element in mat1
 apply(mat1, c(1, 2), function(x) x+2)
 
 # Example function using the sapply() 
 # Create a list of matrices
 mat2 <- matrix(c(x, 2), nrow=2)
 numList <- list(a=mat1, b=mat2)
 numList
 
 # Get the sum of the elements in each matrix and return a vector 
 sapply(numList, sum)
 
 # or the mean
 sapply(numList, mean)
 
 # or the median
 sapply(numList, median)
 
 # Example using experimental data
 # Load data for the tumor size measurements at day 20 & 60
 day20meas <- read.delim("Day20_measurements_2.4.txt", row.names=1)
 day60meas <- read.delim("Day60_measurements_2.4.txt", row.names=1)
 
 head(day20meas)
 str(day20meas)
 
 # Create a list with the day20 and day60 results
 experiment1 <- list(Day_20=day20meas, Day_60=day60meas)
 str(experiment1)
 
 # Write a function to calculate the tumor volume
 # tumor_vol = (L x W x W)/2
 
 tumorVol_calc <- function(x) {
 	vol <- (x[2]*x[1]^2)/2
 	return(vol)
 }
 
 # Test the function with W=2 and L=4 
 tumorVol_calc(c(2, 4))
 
 # Now let's use the sapply to calcule the tumor volume 
 # in each mouse at day 20 and day 60
 # using the apply function on each data frame individually
 # For day20
 apply(experiment1[[1]][, 1:2], 1, tumorVol_calc)
 # For day60
 apply(experiment1[[2]][, 1:2], 1, tumorVol_calc)
 
 # convert the line of code above as a function to use with the sapply() function
 ff <- function(x) apply(x[, 1:2], 1, tumorVol_calc)
 sapply(experiment1, ff)
 
 # Run lapply() on the previous example.
 lapply(experiment1, head)
 
 # or the str() function
 lapply(experiment1, dim)
 
 # Using the lapply function to get tumor volume for each data frame in the experiment1 list.
 lapply(experiment1, ff)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#================================================
# Basics of the sapply() function 
#================================================
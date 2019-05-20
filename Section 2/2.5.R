# setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.5")
#================================================
# Basics of the tapply() function
#================================================
heights <- c(167, 189, 121, 134, 182, 125, 169)
gender <- factor(c("Female", "Male", "Female", "Female", "Male", "Female", "Male"), levels=c("Male", "Female"))
gender

# Use tapply() to calculate mean height by gender
tapply(heights, gender, mean)

# What if you we had missing samples and wanted to use the na.rm argument
weights <- c(200, NA, 167, 250, 178, 121, NA)
tapply(weights, gender, mean) # by default na.rm=FALSE

tapply(weights, gender, mean, na.rm=TRUE)

# To determine the mean tumor volume by mouse group --------- 
# Load the day 60 tumor volumes stored in "tumorVolume_2_5.rda" file
load("tumorVolume_2_5.rda") # loads the tumVolumeDay object
str(tumVolumeDay)

# Mean tumor volume at day 20 and 60 by tumor type
tapply(tumVolumeDay$Day_20, tumVolumeDay$Tumor_Type, mean)

# or better yet for code clarity
day60means <- with(tumVolumeDay, tapply(Day_60, Tumor_Type, mean))
day60means

# To calculate the number of mice with tumor volumes > 300 at day 60 for each group
# create a factor for tumor volumes > 300 at day 60 in tumVolumeDay
tumVolumeDay$d60over300 <- ifelse(tumVolumeDay$Day_60 >= 300, 1, 0)
head(tumVolumeDay)

# Sum of mice with tumor volumes > 300 by group  
with(tumVolumeDay, tapply(d60over300, Tumor_Type, sum))

#================================================
# Basics of the table() function
#================================================
x <- c(12, 3, 4, 4, 4, 8, 3, 17)
table(x)

fruits <- c("apple", "pear", "apple", "orange")
table(fruits)

# Experimental example ---------
# Create a new data frame for tumVolumeDay data
cont <- tumVolumeDay[, 1:3]

# Create a factor for tumor volumes > 300 at day 60 in tumVolumeDay
cont$d20over10 <- ifelse(tumVolumeDay$Day_20 >= 10, "Yes", "No")
cont$d60over300 <- ifelse(tumVolumeDay$Day_60 >= 300, "Yes", "No")
head(cont)

# Use the table() function to create a contingency table
contTable <- table(cont[, 4:5])  
contTable

# The cut() functions ---------
# Using the cut function to group vector elements into bins
set.seed(3682)
x <- rnorm(15, mean=2, sd=3) #create 15 random numbers
bins <- seq(-4, 12, by=3)

# Get the numbers of elements that found in each bin
table(cut(x, bins))

# Or you could simply visualize the results as a vector
cut(x, bins, labels=FALSE)









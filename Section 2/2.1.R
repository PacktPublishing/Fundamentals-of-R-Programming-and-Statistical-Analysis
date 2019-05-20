setwd("~/Downloads/drive-download-20160924T150542Z/Video 2.1")
#==============================================================
# Basics of the subset() function
#==============================================================
x <- c(9, 3, NA, 6, 9, NA)
subset(x, x > 5)

x[x > 5]

# We can create a matrix
mat1 <- matrix(1:20, nrow=4, byrow=TRUE)
colnames(mat1) <- c("A", "B", "C", "D", "E")
head(mat1)

# subset matrix by row and column
subset(mat1, select=c("C", "D", "E"))

# Using the airquality data frame available in R 
head(airquality)
str(airquality)

subset(airquality, Solar.R > 300, select = -c(Ozone, Temp))
subset(airquality, Day==1, select = -c(Ozone, Temp))

# Load the example2_1exprsdata.txt
exprs <- read.delim("example2_1exprsdata.txt", row.names=1)
head(exprs)

# Get expression values for COL4A2 in all samples
geneExprs <- t(exprs)
head(geneExprs)
COL4A2all <- subset(geneExprs, select=COL4A2)
head(COL4A2all

# For samples with COL4A2 expression values > 3 
COL4A2gt3 <- subset(as.data.frame(COL4A2all), COL4A2 > 3)
COL4A2gt3

# Get expression values for COL4A2, ATP5F1, and WNT11
candgenes <- subset(geneExprs, select=c(COL4A2, ATP5F1, WNT11))

subset(as.data.frame(candgenes), COL4A2 > 3)

# or simply if geneExprs is first converted to a data frame
subset(as.data.frame(geneExprs), COL4A2 > 3, select=c(COL4A2, ATP5F1, WNT11))

#==============================================================
# Basics of the with() function
#==============================================================

mat1DF <- as.data.frame(mat1)
head(mat1DF)

with(mat1DF, E - A) 

# Adding the results as a new column to mat1DF directly
mat1DF$EminusA <- with(mat1DF, E - A) 
head(mat1DF)

# Otherwise we could have used the cbind function
mat1DF <- as.data.frame(mat1)
head(mat1DF)

EminusA <- with(mat1DF, E - A)
mat1DF <- cbind(mat1DF, EminusA)
head(mat1DF)

# or simply
mat1DF <- as.data.frame(mat1)
head(mat1DF)

mat1DF <- cbind(mat1DF, EminusA=with(mat1DF, E - A))
head(mat1DF)

# function to convert log2 expression value to the original value
retransformValue <- function(x) 2^x

# Apply to WNT11 expression values
geneExpDF <- as.data.frame(geneExprs)
with(geneExpDF, retransformValue(WNT11))

# Check the results
y <- with(geneExpDF, retransformValue(WNT11))
log2(y)

geneExpDF$WNT11







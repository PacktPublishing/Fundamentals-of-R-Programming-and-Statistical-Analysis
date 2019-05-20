# setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.2")
#==============================================================
# Basics of the which() function
#==============================================================

# Simple example working with a logical vector we create
# you can use T and F instead of TRUE and FALSE
logicalVector <- c(TRUE, T, FALSE, F, F, F, T) 

trueIndices <- which(logicalVector)
logicalVector[trueIndices]
trueIndices

# For the FALSE entries
logicalVector[-trueIndices]

# You can also use 1 and 0 for TRUE and FALSE
logicalVector2 <- as.logical(c(1, 0, 1, 1, 1, 0, 0)) 
which(logicalVector2)

# You get the FALSE entries with the NOT operator !
which(!logicalVector2)
logicalVector2[which(!logicalVector2)]

# Example working with boolean operators
x <- c(1:5, 10:15, 67, 893, 7927)
x > 100

# Now to return the indices for the elements of x > 100
which(x > 100)
# to see the values
x[which(x > 100)]

# Practical example looking at the actin levels by sample group
ACTIN_ug <- c(1280, 787, 768, 1208, 909, 564, 1255, 223, 564)

# Sample groups are spleen (SPN) and bone marrow (BM)
sampleTissue <- c("SPN", "BM", "BM", "SPN", "SPN", "BM", "SPN", "BM", "BM")
sampleNumber <- rep(c("M2179", "M6765", "M5526"), each=3)

# Create a data frame with the entries we have created
ACTINdf <- data.frame(ACTIN_ug, sampleTissue, sampleNumber, stringsAsFactors=FALSE)

# Function to test if sample matches a given tissue and sample number 
testTissueSample <- function(x, tissue, sampleNb){
	if(x[1]==tissue && x[2]==sampleNb) return(TRUE) else return(FALSE)
}

# We are interested in column 2 and 3 that contains the tissue and sample number info
head(ACTINdf[, 2:3])

# Apply the function we have created by row on the ACTINdf[, 2:3] data frame
M6765spn <- apply(ACTINdf[, 2:3], 1, testTissueSample, tissue="SPN", sampleNb="M6765")
M6765spn

# Now let's return the indice where it found tissue="SPN" and sampleNb="M6765"
which(M6765spn)

# We can check the results, as follows:
ACTINdf[which(M6765spn), ] # since which(M6765spn) also corresponds to the row numbers in ACTINdf with tissue="SPN" and sampleNb="M6765"

#==============================================================
# Basics of the grep() function
#==============================================================

x <- c("zapple", "mapple", "apple", "apple2")

grep("apple", x)
grep("apple2", x)

# using regular expressions with fixed=FALSE
# ^ means "starts with"
grep("^apple", x, fixed=FALSE)

# $ means "ends with"
grep("apple$", x, fixed=FALSE)

# To search for for an exact match with apple
# \b used to define the boundary, 
# you must use the escape character with fixed=TRUE, hence \\b
grep("\\bapple\\b", x, fixed=FALSE)

# Using grep, we could have found the entries tissue="SPN" and sampleNb="M6765", as follows: 
ACTINsamps <- paste(sampleTissue, sampleNumber, sep="_")

grep("SPN_M6765", ACTINsamps)
# or on the safer side
grep("\\bSPN_M6765\\b", ACTINsamps) # fixed=FALSE by default



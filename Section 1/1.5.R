# To create the expression matrix data frame for the examples
# Simulate the expression of 50 genes in leukemia_A and leukemia_B.
# More on the biomaRt package in the next course "Bioinformatic Analysis with R" 
library("biomaRt")
mart <- useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
results <- getBM(attributes=c("hgnc_symbol"), mart=mart)
head(results)

# Get 50 genes randomly  with the sample() function
set.seed(2158)
genes <- sample(results$hgnc_symbol, size=50)
head(genes)

# Simulate leukemia_A and leukemia_B expression levels
leukemia_A1 <- rnorm(50, mean=3.3, sd=3)
leukemia_A2 <- rnorm(50, mean=3.2, sd=3)
leukemia_A3 <- rnorm(50, mean=3.4, sd=3)
leukemia_B1 <- rnorm(50, mean=3.7, sd=3)
leukemia_B2 <- rnorm(50, mean=3.1, sd=3)
leukemia_B3 <- rnorm(50, mean=3.5, sd=3)

# Create the expression matrix
exprsMatrix <- cbind(leukemia_A1, leukemia_A2, leukemia_A3, leukemia_B1, leukemia_B2, leukemia_B3)
rownames(exprsMatrix) <- genes
head(exprsMatrix)

write.table(exprsMatrix, "example1-5_exprsMatrix.txt", sep="\t")
#=======================================================
# example 1.5
#=======================================================

# Load the example dataset in R
# More on the read.delim() function in the next video
exprsMatrix <- read.delim("example1-5_exprsMatrix.txt", header=TRUE) 
head(exprsMatrix)

# The read.delim() function automatically imports the data as a data frame
class(exprsMatrix)
exprsMatrix <- as.matrix(exprsMatrix)

# Create a data frame from the exprssion value matrix
# Each gene as a column and sample as row by transposing the matrix with t()
LeukData <- data.frame(t(exprsMatrix))
class(LeukData)

head(LeukData)

# Create a column with the leukemia subtype stored as a factor
subtype <- rep(c("ALL", "CLL"), each=3)
class(subtype)

# To create a factor we use the as.factor or factor function
# we specify the order of the levels with levels argument
LeukSubtype <- factor(subtype, levels=c("ALL", "CLL"))

# we could also reorder the factor levels
LeukSubtypeB <- factor(subtype, levels=c("CLL", "ALL"))

# Reorder the factor levels
x = LeukSubtype
LeukSubtypeB = factor(x,levels(x)[c(2, 1)])
LeukSubtypeB

# Or in this case just change the reference
LeukSubtypeB <- relevel(LeukSubtype, ref="CLL")
LeukSubtypeB

# Update data frame with the leukemia subtype
LeukData <- cbind(LeukData, Subtype=LeukSubtype)
str(LeukData)

# To subset the data frame by ALL subtype
ALLdata <- subset(LeukData, Subtype=="ALL")
head(ALLdata)

# To select CLL samples for the EMP1, PRCC and AQP3 genes (i.e. columns)
CLLdata <- subset(LeukData, Subtype=="CLL", select=c("NECAP1", "ATP5F1", "WNT11"))
head(CLLdata) 

# To get the expression values for the EMP1, PRCC and AQP3 genes for each subtype using the by() function
by(LeukData, LeukData$Subtype, function(x) subset(x, select=c("NECAP1", "ATP5F1", "WNT11")))

# For clarity we could use the LeukSubtype object we created earlier
by(LeukData, LeukSubtype, function(x) subset(x, select=c("NECAP1", "ATP5F1", "WNT11")))

# or even better with the with() function
# more on the with() in the next section in Video 2.1
with(LeukData, by(LeukData, Subtype, function(x) subset(x, select=c("NECAP1", "ATP5F1", "WNT11"))))

# Order the CLLdata by PRCC expression levels
with(CLLdata, CLLdata[order(PRCC), ])

# Another way you can work with data frames is with the data.table package
library(data.table)
LeukTable <- data.table(LeukData[,  c("NECAP1", "ATP5F1", "WNT11")])

# Order the samples bt PRCC expression levels
LeukTable[order(WNT11), ] 

# Add a column to the LeukTable with the mean WNT11 expression level by subtype
LeukTable[, MeanExprs_WNT11:=mean(WNT11), by=list(LeukSubtype)]
LeukTable

# We can test our results 
LeukTable[, WNT11] # returns a vector of the WNT11 values
mean(LeukTable[, WNT11[1:3]]) # ALL mean
mean(LeukTable[, WNT11[4:6]]) # CLL mean




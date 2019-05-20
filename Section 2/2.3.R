# setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.3")
#==============================================================
# Basics of the sort() function
#==============================================================

Sort (or order) a vector or factor (partially) into ascending or descending order. For 
ordering along more than one variable, e.g., for sorting data frames, see order.

# To sort by ascending order
# by default the sort() function decreasing argument is set to FALSE
x <- c(1897, 12, 23, 7, 9, 210, 2)
sort(x)

# To sort by descending order
sort(x, decreasing=TRUE)

# You can also sort character vectors
fruits <- c("apple", "pear", "banana", "grapes")
sort(fruits)

sort(fruits, decreasing=TRUE)

# For our detailed example let's load the gene expression data from video 2.1
# example2_1exprsdata.txt

exprs <- read.delim("example2_1exprsdata.txt", row.names=1)
head(exprs)

# Let's create a vector containing all the genes and expression values for the MLL1 sample
MLL1_exprs <- exprs$MLL_1

# To add the gene names to the expression values
names(MLL1_exprs) <- rownames(exprs)
head(exprs)
head(MLL1_exprs)

# Sort the MLL1_exprs from highest to lowest expression value
MLL1hiLow <- sort(MLL1_exprs, decreasing=TRUE)

# For the top 10 genes by expression
MLL1top10 <- MLL1hiLow[1:10]
MLL1top10

# To get the indices for the sorted elements of the MLL1_exprs
MLL1hiLow <- sort(MLL1_exprs, decreasing=TRUE, index.return=TRUE)
# notice the sort function returns a list with the sorted vector stored in $x
# and the index positions stored in $xi 
MLL1hiLow 

# Instead of using the sort function to retrieve the indices we could use the order() function
# By ascending order
order(MLL1_exprs)
# By descending order
order(MLL1_exprs, decreasing=TRUE)
# which is the same as 
MLL1hiLow$ix

# We use the order() to sort a data frame 
exprsMLL1ord <- exprs[order(exprs$MLL_1, decreasing=TRUE), ]
head(exprsMLL1ord, 10) # to print the first 10 rows

# To simplify our code we could use the with() function
exprsMLL1ord1 <- with(exprs, exprs[order(MLL_1, decreasing=TRUE), ])
head(exprsMLL1ord1, 10)

# Since we know the indices from MLL1$ix we could have also written
exprsMLL1ord2 <- exprs[MLL1hiLow$ix, ]
head(exprsMLL1ord2, 10)

# You can also order your data frame by multiple variables.
# To order the exprs data frame by MLL_1 followed by MLL_2 values
# instead of using the decreasing argument you can use minus "-" sign 
inds <- with(exprs, order(-MLL_1, -MLL_2))
exprsMLL1_2ord <- exprs[inds, ]
head(exprsMLL1_2ord, 20)

# to order exprs with MLL_1 ascending then MLL_2 descending
inds <- with(exprs, order(MLL_1, -MLL_2))
exprsMLL1_2ord <- exprs[inds, ]
head(exprsMLL1_2ord, 20)

# might be easier to see names with names and ages
# eg. sort by oldest to youngest then by name in alphabetical order
lab_members <- data.frame(First_name=c("Mathew", "Carol", "John"), Age=c(27, 56, 18), stringsAsFactors=FALSE)
with(lab_members, lab_members[order( -Age, First_name), ])





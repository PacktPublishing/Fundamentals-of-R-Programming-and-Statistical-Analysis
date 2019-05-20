# To run example on the laptop
setwd("/Users/radiamariejohnson/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 1/Video 1.6")

#=======================================================
# example 1.6
#=======================================================

# setwd("/path/directory") # enter path where the file is saved.

mydata <- read.table("Example1.6_TumorMeasurements.txt", sep="\t", header=TRUE)
head(mydata)

# To specify which column to use as rownames
mydata <- read.table("Example1.6_TumorMeasurements.txt", sep="\t", row.names=1, header=TRUE)
head(mydata)
str(mydata)

# To keep strings as character vectors instead of factors
mydata <- read.table("Example1.6_TumorMeasurements.txt", sep="\t", row.names=1, stringsAsFactors=FALSE, header=TRUE)
head(mydata)
str(mydata)

# Alternatively, we could use the read.delim() function directly
mydata <- read.delim("Example1.6_TumorMeasurements.txt", row.names=1, stringsAsFactors=FALSE, header=TRUE)
head(mydata)

# To read CSV files
mydata <- read.table("Example1.6_TumorMeasurements.csv", sep=",", row.names=1, stringsAsFactors=FALSE, header=TRUE)
head(mydata)

# or 
mydata <- read.csv("Example1.6_TumorMeasurements.csv", row.names=1, stringsAsFactors=FALSE, header=TRUE)
head(mydata)

# To load excel sheet with gdata package
library("gdata")
mydata <- read.xls("Example1.6_TumorMeasurements.xlsx", sheet=1, row.names=1, stringsAsFactors=FALSE, header=TRUE)
head(mydata)

# Alternatively, you can use the XLConnect package by loading the workbook and then reading the sheet
library("XLConnect")
myWorkbook <- loadWorkbook("Example1.6_TumorMeasurements.xlsx")
mydata <- readWorksheet(myWorkbook, sheet=1, rownames=1) # notice its rownames and not row.names to select the column to be used for the rownames
head(mydata)

# We can also use other parameters such as the startCol, endCol parameters to select a subset of columns to enter
mydata <- readWorksheet(myWorkbook, sheet=1, rownames=1, startCol=1, endCol=3) # notice its rownames and not row.names to select the column to be used for the rownames
head(mydata)

# To load SPSS files into R as data frames
# Example not run in R (Demonstration only)
library("foreign")
mydata <- read.spss("myfile.spss", to.data.frame=TRUE)

# To load json files
# Example not run in R (Demonstration only)
library("rjson")

# Loads the data into R as a list of vectors that we can convert to a data frame with the as.data.frame() function
mydata_list <- fromJSON(file = "myfile.json")
mydata_dataframe <- as.data.frame(mydata_list)

x <- c(1, 3, 9)
y <- matrix(1:20, 4, 5)

save(x, y, file="exampleData.RData")

# You could also use the saveRDS() function but you need to save each object seperately.

saveRDS(x, "x.rds")
saveRDS(y, "y.rds")

# To load the data back into R
load("exampleData.RData")
x2 <- readRDS("x.rds")

# To save data
write.table(myData.df, file="savedata_file.txt", quote = FALSE, sep = "\t", row.names=TRUE, col.names=TRUE, append=FALSE) 

# By default there is no column name for a column of row names. So your output would look like this:
#	V1	V2	V3
#	1	A	B	C
#	2	12	6	8
#	3	4	9	2
#	4	5	13	3

# To correct this problem for viewing in a spreadsheet viewer such as Excel. You could write the table setting col.names=NA and row.names=TRUE.
write.table(myData.df, file="savedata_file.txt", quote = FALSE, sep = "\t",col.names = NA, row.names = TRUE, append=FALSE)
#		V1	V2	V3
#	1	A	B	C
#	2	12	6	8
#	3	4	9	2
#	4	5	13	3

# Otherwise, you could use the write.csv() function which has col.names=NA and row.names=TRUE set as defaults. 
write.csv(myData.df, file = "savedata_file.csv") #same output as above
df1 <- data.frame(letters=c("A", "B", "C", "D"), numbers=1:4)
df2 <- data.frame(letters=c("E", "F", "G", "H"), numbers=5:8)

df1
df2

# To save df1 and df2 as separate sheets in an excel workbook
library(WriteXLS)
dfs.tosave <- c("df1", "df2")
sheets.tosave <- c("df1_results ", "df2_results")
WriteXLS(dfs.tosave, ExcelFileName = "combined_dfs_workbook.xls", SheetNames = sheets.tosave)


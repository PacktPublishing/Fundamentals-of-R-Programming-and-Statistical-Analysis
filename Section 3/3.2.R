setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 3/Video 3.2")
#=======================================================
# examples 
#=======================================================

# Use biomaRt to get gene symbols
library("biomaRt")
mart <- useMart(biomart="ensembl", dataset="hsapiens_gene_ensembl")
results <- getBM(attributes=c("hgnc_symbol"), mart=mart)
head(results)

# Select 50 genes from the results downloaded from biomart
set.seed(189)
genes <- sample(results$hgnc_symbol, size=50, replace=FALSE)

# Simulate gene expression values for these 50 genes
exprsvalues <- runif(50, min = 0, max = 20)   
names(exprsvalues) <- genes 

# Use ggplot2 package to create basic plots
library(ggplot2)
#--------------------------------
# Plotting histograms 
#--------------------------------
# using the qplots() function
qplot(exprsvalues, geom="histogram")

# You can change the aesthetics of the plot as follows:
qplot(exprsvalues, geom="histogram", binwidth = 5, 
main = "Simulated Expression Values", xlab="values", 
fill=I("green"), col=I("red"), alpha=I(0.4)) # I() function used to nest a color

# using the ggplot() function
df <- as.data.frame(exprsvalues)
ggplot(data=df, aes(x=exprsvalues)) + geom_histogram()

# Alternatively, you create a ggplot object as follows:
pp <- ggplot(data=df, aes(x=exprsvalues))
pp + geom_histogram()

# You can add aesthetics to your plots as follows:
pp2 <- pp + geom_histogram(binwidth=5, col="red", fill="green", alpha = .4) 
pp2 
                
# We can further details as follows:                 
pp2 + labs(title="Simulated Expression Values") + labs(x="Values")

# Say we wanted to add a density curve to our histogram
pp + geom_histogram(aes(y =..density..), col="blue", fill="green", alpha = .4) + geom_density(col="black", size = 2)
#--------------------------------
# Next series of examples
#--------------------------------
# Simulate the expression value of those 50 genes in KO
exprsvaluesKO <- exprsvalues + runif(50, 1, 4)
names(exprsvaluesKO) <- genes

df2 <- data.frame(WT=exprsvalues, KO=exprsvaluesKO)
head(df2)

#--------------------------------
#  Plotting scatterplots
#--------------------------------
ggplot(df2) +
  geom_point(aes(WT, KO), color = 'blue') +
  geom_text(aes(WT, KO, label = rownames(df2)))
 
# You can repel the text lables using the ggrepel package 
# by replacing geom_text() with geom_text_repel()
library("ggrepel")  
ggplot(df2) +
  geom_point(aes(WT, KO), color = 'blue') +
  geom_text_repel(aes(WT, KO, label = rownames(df2)))

# With a white background
ggplot(df2) +
  geom_point(aes(WT, KO), color = 'blue') +
  geom_text_repel(aes(WT, KO, label = rownames(df2))) + theme_bw(base_size = 16)
  
#--------------------------------  
# Creating volcano plots
#--------------------------------
# Load the DEG results 
exLFCdata <- readRDS("exampleLogFCdata.rds")

# Get the significant genes
exLFCdata$Significant <- ifelse(exLFCdata$P.Value < 0.001, "p < 0.001", "Not Sig")
exLFCdata$Gene <- rownames(exLFCdata)

ggplot(exLFCdata, aes(x = logFC, y = -log10(P.Value))) +
  geom_point(aes(color = Significant)) +
  scale_color_manual(values = c("grey", "red")) +
  theme_bw(base_size = 16) +
  geom_text_repel(
    data = subset(exLFCdata, P.Value < 0.001),
    aes(label = Gene),
    size = 4,
  )
  

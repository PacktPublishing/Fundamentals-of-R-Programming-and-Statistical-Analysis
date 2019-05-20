setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 6/Video 6.5")
#==============================
# Examples for video 6.5
#==============================
# Download the eset object from https://dl.dropboxusercontent.com/u/30969719/eset.rds
library("limma")

eset <- readRDS("eset.rds") # eset object created from GSE22093

head(pData(eset))
phenoData <- pData(eset)

# For tumor grade
grade <- sapply(strsplit(as.character(phenoData$characteristics_ch1.10), ": "), function(x) x[[2]])
head(grade)

# Define the groups for differential expression
grade3status <- function(x) ifelse(x=="3", "grade 3", "other")
grp <- factor(grade3status(grade), levels=c("other", "grade 3"))

# Get filtered expression data
M1 <- exprs(eset)
dim(M1)

# define model matrix for lmFit
design <- model.matrix(~grp)
head(design) 

# Fit models
fit <- lmFit(M1, design)
fit <- eBayes(fit)

res <- topTable(fit, coef="grpgrade 3", n="Inf", adjust.method="BH")
dim(res)
head(res, 10)

write.csv(res, "Limma_DEG_results.csv")

# Using contrast matrices to look at multiple comparisons
p53status <- sapply(strsplit(as.character(phenoData$characteristics_ch1.3), ": "), function(x) x[[2]])
p53status[which(p53status=="n/a")] <- "ND"
p53 <- factor(p53status)

design <- model.matrix(~0+p53)
levels(p53)
colnames(design)

fit <- lmFit(eset, design)

contrast.matrix <- makeContrasts(p53MUT-p53WT, p53ND-p53MUT, p53ND-p53WT, levels=design)
fit2 <- contrasts.fit(fit, contrast.matrix)
fit2 <- eBayes(fit2)

topTable(fit2, coef=1, adjust="BH")

# To get Venn diagram of the results
results <- decideTests(fit2)
vennDiagram(results)















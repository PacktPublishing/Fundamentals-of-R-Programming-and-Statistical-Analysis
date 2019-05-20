setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 5/Video 5.1")

load(url("http://www.ebi.ac.uk/arrayexpress/files/E-GEOD-19577/E-GEOD-19577.eSet.r"))
MLLpartner.ds <- study

library("affy")
library("Biobase")

AEsetnorm = rma(MLLpartner.ds)
head(exprs(AEsetnorm)) #output shown truncated
probeA <- as.numeric(exprs(AEsetnorm)[1,])
probeA <- setNames(probeA, colnames(exprs(AEsetnorm)))
probeB <- as.numeric(exprs(AEsetnorm)[2,])
probeB <-setNames(probeB, colnames(exprs(AEsetnorm)))
MLLpartner.mx <- as.matrix(exprs(AEsetnorm))

#Save the data for easy reload
save(MLLpartner.mx, probeA, probeB, file="MLLexdataset.RData")

# or load the object directly
load("MLLexdataset.RData")

#----------------------------------
# One sample tests examples
#----------------------------------
female.heights <- c(117, 162, 143, 120, 183, 175, 147, 145, 165, 167, 179, 116)
mean(female.heights)

# Wilcoxon signed-rank test
wilcox.test(female.heights, mu=171)

wilcox.test(female.heights, mu=171, conf.int = TRUE, conf.level = 0.99)

# One sample T-test
t.test(female.heights, mu=171)

# F-test
# Compares the variance of two sample distributions
var.test(probeA, probeB)

# Kruskal-Wallis test
# Are the two samples populations identical with assuming they follow a Gaussian distribution?
head(probeA) # 42 samples
drugResponse <- factor(rep(c("Response", "Failed"), each=21))

kruskal.test(probeA ~ drugResponse)

# Two sample tests
t.test(probeA, probeB)
wilcox.test(probeA, probeB)
wilcox.test(probeA, probeB, paired=TRUE)



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

# Examples start here
class(MLLpartner.mx)
dim(MLLpartner.mx)
summary(probeA)
summary(MLLpartner.mx) 

min(probeA)
max(probeA)
mean(probeA)
median(probeA)
quantile(probeA)
quantile(probeA, probs = c(0.1, 0.2, 0.6, 0.9))
round(mean(probeA), 2)

# Examining basic statistics
df <- data.frame(expr_probeA=probeA, expr_probeB=probeB, drugA_response= factor(rep(c("success", "fail"), 21)))
head(df)
by(df, df$drugA_response, summary)
max(probeA) - min(probeA)
range(probeA)
mean(probeA)
sd(probeA)
var(probeA)




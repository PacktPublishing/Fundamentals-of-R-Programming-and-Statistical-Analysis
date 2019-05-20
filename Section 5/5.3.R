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

#-----------------------------------------------
# Examples start here
#-----------------------------------------------

qqnorm(probeA)

qqline(probeA, distribution = qnorm,  probs = c(0.25, 0.75))

# Fitting a gamma distribution with fitdistr
require(MASS)
fitdistr(probeA, 'gamma')
gamma.par <- fitdistr(probeA, 'gamma')
str(gamma.par)
gamma.par$estimate['shape'] #or gamma.par$estimate[1]
s <- gamma.par$estimate['shape']
r <- gamma.par$estimate['rate']
theoretical.probs <- seq(1:length(probeA))/(length(probeA)+1)
theoretical.quantiles <- qgamma(theoretical.probs,shape=s,rate=r)
plot(theoretical.quantiles, sort(probeA),xlab="Theoretical Quantiles",ylab="Sample Quantiles",main="Gamma QQ-plot")
qF <- function(p) qgamma(p, shape=s, rate=r)
qqline(y=sort(probeA), distribution=qF)

# Testing the fit with ks.test() and ad.test()
ks.test(probeA, "pgamma", 3, 2)
require(nortest)
ad.test(probeA)



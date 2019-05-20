#==============================
# Examples for video 6.3
#==============================

gapdh.qPCR <- read.table(header=TRUE, text='
 GAPDH	RNA_ng	A1	A2	A3
std_curve	50	16.5	16.7	16.7
std_curve	10	19.3	19.2	19
std_curve	2	21.7	21.5	21.2
std_curve	0.4	24.5	24.1	23.5
std_curve	0.08	26.7	27	26.5
std_curve	0.016	36.5	36.4	37.2
 ')

str(gapdh.qPCR)

library(reshape2)
gapdh.qPCR <- melt(gapdh.qPCR, id.vars=c("GAPDH", "RNA_ng"), value.name="Ct_Value")
str(gapdh.qPCR)
head(gapdh.qPCR)

attach(gapdh.qPCR)
names(gapdh.qPCR)

# Plot the Ct values
par(mfrow=c(1,2))
plot(RNA_ng, Ct_Value)
plot(log(RNA_ng), Ct_Value)

lm(Ct_Value ~ log(RNA_ng))

model <- lm(Ct_Value ~ log(RNA_ng))
summary(model)

par(mfrow=c(1,1))
plot(model)

# Removing an outlier e.g. sample 18
RNA_ng[18]
Ct_Value[18] 

model2 <- update(model, subset=(Ct_Value !=37.2))
summary(model2)

# Runs: lm(formula = Ct_Value ~ log(RNA_ng), subset = (Ct_Value != 37.2))
plot(model2)

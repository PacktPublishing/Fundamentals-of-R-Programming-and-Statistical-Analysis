#==============================
# Examples for video 6.4
#==============================
patient.fatigue <- read.table(header=TRUE, text='
   patients fatigue drugA_dose
                              1         1     low        0.2
                              2         2     low        0.2
                              3         3     med        0.2
                              4         4     med        0.2
                              5         5     med        0.2
                              6         6     low        0.4
                              7         7     low        0.4
                              8         8     low        0.4
                              9         9     med        0.4
                              10       10     med        0.4
                              11       11     med        0.8
                              12       12    high        0.8
                              13       13     med        0.8
                              14       14     med        0.8
                              15       15    high        0.8
                              16       16    high        1.2
                              17       17    high        1.2
                              18       18    high        1.2
                              19       19    high        1.2
                              20       20     med        1.2 ')
attach(patient.fatigue)
aov(drugA_dose ~ fatigue)

summary(aov(drugA_dose ~ fatigue))

modelA <- aov(drugA_dose ~ fatigue)
par(mfrow=c(2,2)) 
plot(modelA) 

modelB <- update(modelA, subset=(patients !=20))
summary(modelB)

# To investigate the effects of the different levels 
# with the summary.lm() function
summary.lm(modelB)
patient.sex <- as.factor(c("F", "F", "F", "M", "M", "F", "M", "M", "M", "F", "F", "M", "M", "F", "F", "F", "M", "M", "F", "M")) 
modelC = aov(drugA_dose ~ fatigue*patient.sex) 
summary(modelC)
# the effects of gender and fatigue are not additive
# there is not a significant relationship between drug_A_dose and patient.sex
# To compare both models
anova(modelA, modelC)

# Minimal adequate model is modelA

# Running a one way Anova (Simplified Version)
aov.out = with(patient.fatigue, aov(drugA_dose ~ fatigue))
summary(aov.out)

# Ad Hoc Analysis
TukeyHSD(aov.out)
TukeyDF <- TukeyHSD(aov.out)$fatigue
write.csv(TukeyDF, file="PatientFatigue_AnovaTukeyStats.csv")



setwd("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 3/Video 3.5")
#=======================================================
# examples 
#=======================================================

#--------------------------------
# Boxplots with ggplot2 
#--------------------------------
# Load the example data tumorVolume_2_5.rda
load("~/Bioinformatics_With_R_PACKT/Packt Video Kit/MetadataTemplate- Start Recording/Section 2/Video 2.5/tumorVolume_2_5.rda")
head(tumVolumeDay)

library("reshape2")
tvolmelt<-melt(tumVolumeDay, measure.vars = 1:2)
head(tvolmelt)

library("ggplot2")
pp2 <- ggplot(tvolmelt, aes(x=Tumor_Type, y=value)) 
pp2 + geom_boxplot()
pp2 + geom_boxplot(aes(fill = variable))
pp2 + geom_boxplot(aes(fill = variable)) + scale_y_log10()

#--------------------------------
#Boxplots with easyGgplot2 package
#--------------------------------
# To install easyGgplot2
# install.packages("devtools")
# library("devtools")
# install_github("kassambara/easyGgplot2")
library("easyGgplot2")

# Load the example data
# Box plot with centered dots
ggplot2.boxplot(data=tumVolumeDay, xName='Tumor_Type',yName='Day_20',
                addDot=TRUE, dotSize=1, dotPosition="center")

ggplot2.boxplot(data=tumVolumeDay, xName='Tumor_Type',yName='Day_60',
                addDot=TRUE, dotSize=1, dotPosition="center",
                mainTitle="Day 60 Tumor Measurements",
                xtitle="Tumor Type", ytitle="volume", backgroundColor="white")

#Change the dot plot border 
ggplot2.dotplot(data=tumVolumeDay, xName='Tumor_Type',yName='Day_60')

ggplot2.violinplot(data=tumVolumeDay, xName='Tumor_Type',yName='Day_60', 
    groupName='Tumor_Type', groupColors=c('red','navy'), showLegend=FALSE,
    backgroundColor="white", xtitle="Dose (mg)", ytitle="length", 
    mainTitle="Plot of length \n by dose",
    addDot=TRUE, dotSize=1)

# For other examples see http://www.sthda.com/english/wiki/easyggplot2

rm(list = ls())
library("readxl")
tour <- read_excel("/Users/Jackie/Desktop/MSBA5504-advanced-data-analytics/data-files/tourlpga2012.xlsx")


#descriptive stats
summary(tour)
plot(tour)

colnames(tour)[colnames(tour) == 'Scoring Average'] <- 'Score'
colnames(tour)[colnames(tour) == 'Sand Saves'] <- 'Saves'

tour1 <- lm(Score ~ DrDist + DrAccu + GIR + Saves + PPR, data = tour)
tour1$coefficients # coefficients
summary(tour1)
#remove saves with 0.2079 pvalue

#find best IV
tour2 <- lm(Score ~ DrDist + DrAccu + GIR + PPR, data = tour)
summary(tour2)
#remove drdist with 0.20

tour2 <- lm(Score ~  DrAccu + GIR + PPR, data = tour)
summary(tour2)
#remove draccu with 0.144

tour2 <- lm(Score ~ GIR + PPR, data = tour)
summary(tour2)
#leave as is with GIR and PPR significant 
#r squared is 96.04%



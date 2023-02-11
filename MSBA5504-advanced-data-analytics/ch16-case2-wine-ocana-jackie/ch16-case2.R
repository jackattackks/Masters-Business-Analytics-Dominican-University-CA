rm(list = ls())
library("readxl")
wineratings <- read_excel("/Users/Jackie/Desktop/MSBA5504-advanced-data-analytics/data-files/wineratings.xlsx")

#Q1
#Develop a table that shows the number of wines that were classified as classic, 
#outstanding, very good, good, mediocre, and not recommended and the average price. 
#Does there appear to be any relationship between the price of the wine and the 
#Wine Spectator rating? Are there any other aspects of your initial summary of the
#data that stand out?

table(wineratings$Rating)
wineratings_mlr <- lm(Price ~ Score, data=wineratings)
summary(wineratings_mlr)


#Q2
#Develop a scatter diagram with price on the horizontal axis and the Wine 
#Spectator score on the vertical axis. Does the relationship between price and 
#score appear to be linear?

library(ggplot2)
ggplot(wineratings, aes(x = `Price`, y = `Score`)) +
  geom_point()

#The relationship does not appear to be linear. It appears to be curvilinear.

#Q3
#Using linear regression, develop an estimated regression equation that can be 
#used to predict the score given the price of the wine.

wineratings_mlr2 <- lm(Score ~ Price, data=wineratings)
summary(wineratings_mlr2)
#Score = 87.763226 + 0.027995x

#Q4
#Using a second-order model, develop an estimated regression equation that can be 
#used to predict the score given the price of the wine.

modelc <- lm(Price ~ poly(Score, 2, degree = 2, raw = T), data = wineratings)
summary(modelc)
#t indicates polynomial model
#y=11785.9704+-278.4274x + 1.6450x^2

#Q5
#Compare the results from fitting a linear model and fitting a second-order model.

#The model in question 4 has a higher r squared indicating a stronger relationship 
#than the previous model

#Q6
#As an alternative to fitting a second-order model, fit a model using the natural
#logarithm of price as the independent variable. Compare the results with the 
#second-order model.

wineratings$LnPrice <-log(wineratings$Price)
modelln <- lm(LnPrice ~ Price, data = wineratings)
summary(modelln)
plot(modelln, which = 3)
#This is an even stronger relationship than with the previous model as r squared is 
#even higher

#Q7
#Based upon your analysis, would you say that spending more for a bottle of wine 
#will provide a better wine?

#up until a certain point, yes it is a better wine, however, eventually it plateus,
#and the price does not make much of a difference.

#Q8
#Suppose that you want to spend a maximum of $30 for a bottle of wine. In this 
#case, will spending closer to your upper limit for price result in a better wine
#than a much lower price?

#No, it will not result in a much better wine.

#y=c(1650,4200,1050,1400,310,2650,375,430,140,75,62,130,400,220,72)
#x=c(18,19,18,19,16,19,18,17,17,15,14,16,17,16,13)
#model<-lm(y~log(x))
#summary(model)

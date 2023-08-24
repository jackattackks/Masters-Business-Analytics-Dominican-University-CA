# 1. dummy coding for categorical variables 
# 2. find a model and explain why
# 3. check assumptions 
# 4. interpret significant coefficients (save your interpretation in your R script)
# 5. submit your script. 

rm(list=ls())

library(readxl)
regress <- read_excel("/Users/Jackie/Desktop/Masters-Business-Analytics-Dominican-University-CA/MSBA5508-Marketing-Analytics/final-quiz/regression.xlsx")
View(regress)

ls(regress)
data <- regress
str(data)
ls(data)

data$size<-ifelse(data$size=='large',1,0)
str(data)
head(data)
ls(data)

data$region<-ifelse(data$region=='North',1,0)
str(data)
head(data)

# Print
str(data)

library(olsrr)
library(MASS)

model4<-lm(pq~., data = data)
ols_step_both_p(model4)
plot(ols_step_both_p(model4))
ols_step_both_p(model4, details = TRUE)
#stepwise was chosen as it includes the most robust information available
#on the data set

summary(model4)
# productline, likePur, delivery, newpeo, region are the most significant in descending
# order. The model has a low adjusted r squared of 0.4788 indicating this model 
# may not be the best fit

residuals<-model4$residuals
hist(residuals)
qqnorm(residuals)
qqline(residuals)

# based on this chart it may be worth looking into a model like qudartic

plot(cooks.distance(model4),pch=16,col="orange")
warnings()

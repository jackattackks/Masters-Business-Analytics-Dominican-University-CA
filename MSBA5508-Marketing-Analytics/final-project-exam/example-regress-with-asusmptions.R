# example in class
# regress with asusmptions

install.packages("olsrr")
library(olsrr)
library(MASS)
ls(reg_data)

library(readxl)
reg_data <- read_excel("reg data.xlsx")
View(reg_data)

model <- lm(pur~ cp + ds + ob + pq + satis, data = reg_data)
ols_step_all_possible(model)
plot(ols_step_all_possible(model))

ols_step_best_subset(model)
plot(ols_step_best_subset(model))

#stepwise forward 
model2<-lm(pur~., data = reg_data)
ols_step_forward_p(model2)
plot(ols_step_forward_p(model2))
ols_step_forward_p(model2, details = TRUE)

#stepwise backward
model3<-lm(pur~., data = reg_data)
ols_step_backward_p(model3)
plot(ols_step_backward_p(model3))
ols_step_backward_p(model3, details = TRUE)

#stepwise 
model4<-lm(pur~., data = reg_data)
ols_step_both_p(model4)
plot(ols_step_both_p(model4))
ols_step_both_p(model4, details = TRUE)

#regression 
summary(model)

#normality
residuals<-model$residuals
hist(residuals)
qqnorm(residuals)
qqline(residuals)

#multicollinearity
#1 correlation 
install.packages("ggcorrplot")
library(ggcorrplot)
reduced<-subset(reg_data,select=-pur)
corr_matrix<-round(cor(reduced),2)
ggcorrplot(corr_matrix,hc.order=TRUE,type="lower",lab=TRUE)
#2VIF
install.packages("car")
library(car)
vif(model)

#outlierness
#1influential points 
plot(cooks.distance(model),pch=16,col="blue")
#2leverage points 
hats<-as.data.frame(hatvalues(model))
hats
plot(hatvalues(model),type = 'h')
#3outlier test
outlierTest(model)
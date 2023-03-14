# Clear the environment
rm(list = ls())

# Set the working directory
setwd("/Users/Jackie/Desktop/Masters-Business-Analytics-Dominican-University-CA/MSBA5504-advanced-data-analytics/data-files")


library(readxl)
Q7 <- read_excel("CH17-Q7.xlsx")

Q7$Q <- as.factor(Q7$Q)
#Q7dummy <- as.data.frame(model.matrix(~ Q -1, Q7))
#Q7 <- cbind(Q7dummy, Q7)
#Q7$period <- c(1:12)
Q7model <- lm(value ~ q1 + q2 + q3, data = Q7)
summary(Q7model)

predict(Q7model, data.frame(q1=1, q2=0, q3=0, period=13))
predict(Q7model, data.frame(q1=0, q2=1, q3=0, period=13))
predict(Q7model, data.frame(q1=0, q2=0, q3=1, period=13))
predict(Q7model, data.frame(q1=0, q2=0, q3=0, q4=1, period=13))
        
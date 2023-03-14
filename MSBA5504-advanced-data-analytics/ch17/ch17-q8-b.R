# Clear the environment
rm(list = ls())

# Set the working directory
setwd("/Users/Jackie/Desktop/Masters-Business-Analytics-Dominican-University-CA/MSBA5504-advanced-data-analytics/data-files")


library(readxl)
Q8 <- read_excel("ch17-Q8V2.xlsx")

Q8$quarter <- as.factor(Q8$quarter)
Q8dummy <- as.data.frame(model.matrix(~ quarter -1, Q8))
Q8 <- cbind(Q8dummy, Q8)                         
Q8$period <- c(1:20)
Q8model <- lm(year1 ~ quarter1 + quarter2 + quarter3 + period, data = Q8)
summary(Q8model)

predict(Q8model, data.frame(quarter1=1, quarter2=0, quarter3=0, period=21))
predict(Q8model, data.frame(quarter1=0, quarter2=1, quarter3=0, period=22))
predict(Q8model, data.frame(quarter1=0, quarter2=0, quarter3=1, period=23))
predict(Q8model, data.frame(quarter1=0, quarter2=0, quarter3=0, period=24))

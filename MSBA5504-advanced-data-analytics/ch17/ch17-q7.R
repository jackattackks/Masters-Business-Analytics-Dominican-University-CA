# Clear the environment
rm(list = ls())

# Set the working directory
setwd("~/Desktop/")


library(readxl)
data <- read_excel("squared.xlsx")
data_slr <- lm(subs ~ x2 + Period, data = data)
coefficients (data_slr)
summary(data_slr)

anova(data_slr)

mean(data_slr$residuals^2)

data_slr2 <- lm(subs ~ Period, data = data)
mean(data_slr2$residuals^2)


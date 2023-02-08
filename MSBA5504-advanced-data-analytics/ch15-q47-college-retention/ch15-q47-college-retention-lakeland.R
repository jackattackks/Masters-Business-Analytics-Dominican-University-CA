#College Retention. Over the past few years the percentage of students who leave 
#Lakeland College at the end of the first year has increased. Last year Lakeland
#started a voluntary one-week orientation program to help first-year students 
#adjust to campus life. If Lakeland is able to show that the orientation program 
#has a positive effect on retention, they will consider making the program a 
#requirement for all first-year students. Lakeland’s administration also suspects 
#that students with lower GPAs have a higher probability of leaving Lakeland at 
#the end of the first year. In order to investigate the relation of these 
#variables to retention, Lakeland selected a random sample of 100 students from 
#last year’s entering class. The data are contained in the data set named 
#Lakeland; a portion of the data follows. see file lakeland.xlsx

rm(list = ls())
library("readxl")
lakeland <- read_excel("/Users/Jackie/Desktop/MSBA5504-advanced-data-analytics/data-files/Lakeland.xlsx")
lakeland_mlr <- lm(Return ~ GPA + Program, data=lakeland)
summary(lakeland_mlr)

#a. Write the logistic regression equation relating x1 and x2 to y. 
#y = -0.41348 + (0.32121*x1)+ (0.30188*x2)

#b. What is the interpretation of E(y) when x2 = 0? 
#when students dont attend orientation they are more likely to not return.

#c. Use both independent variables and statistical software to compute the 
#estimated logit. 
library(stats)
lakeland_model <- glm(Return ~ GPA + Program, data=lakeland, family='binomial')
exp(lakeland_model$coefficients[-1])
logit <- 1/(1+exp(0.4039))
logit
#logit = 0.4003757
#d. Conduct a test for overall significance using alpha =  .05. 

#e. Use alpha =  .05 to determine whether each of the independent variables is 
#significant. 
summary(lakeland_mlr)
#Both GPA and Program attendance are significant with p values at 8.19e-06 and
#0.00102 respectively

#f. Use the estimated logit computed in part (c) to estimate the probability that
#students with a 2.5 grade point average who did not attend the orientation 
#program will return to Lakeland for their sophomore year. What is the estimated 
#probability for students with a 2.5 grade point average who attended the orientation program? 
predict(lakeland_mlr, data.frame(GPA =2.50, Program = 0), type="response")
predict(lakeland_mlr, data.frame(GPA =2.50, Program = 1), type="response")
#Student with a 2.5 GPA who attended orientation have a probability of 0.6914272
#to return to the school

#g. What is the estimated odds ratio for the orientation program? Interpret it. 
#0.69/(1-0.69)
#0.69/0.31
#77.5% will return while 22.5% will not return 

#h. Would you recommend making the orientation program a required activity? Why or why not?
#Yes, I would because it is proven through the above calculations that 
#students are more likely to stay enrolled in the school when they 
#attended orientation.
library(readxl)
nascar <- read_excel("/Users/Jackie/Desktop/MSBA5504-advanced-data-analytics/data-files/nascar.xlsx")
summary(nascar)

#Q1 Suppose you wanted to predict Winnings ($) using only the number of 
#poles won (Poles), the number of wins (Wins), 
#the number of top five finishes (Top 5), or the 
#number of top ten finishes (Top 10). Which of these 
#four variables provides the best single predictor of 
#winnings?
#Top 5 is best predictor
modelpoles <- lm(Winnings ~ Poles + Wins + Top_5 + Top_10, data = nascar)
summary(modelpoles)
modelpoles$coefficients

# Q2 Develop an estimated regression equation that can be used to predict 
#Winnings ($) given the number of poles won (Poles), the number of wins 
#(Wins), the number of top five finishes (Top 5), and the number of top ten 
#(Top 10) finishes. Test for individual significance and discuss your 
#findings and conclusions.

#winnings = mx + b 
#winnings = 3140367 + (-12939*Poles) + (13545*Wins) + (Top_5*71629) + 
  #(Top_10*117071)

#The variable that has the most significance is the Top_10 as its p-value is
#below 0.01 with 0.00147. Also with Top_10 there is a 117071 increased chance of 
#winning. The standard error for this is +- 117071.
#The variables with least significance are Poles and Wins are their p-values are 
#0.90474 and 0.90389 respectively. Both are well above 0.01 p-value.
#While Top_5 is above p-value with 0.16773, is it significantly lower than poles 
#and wins indicating it is a better predictor than those. However, it is not as
# dependable of a predictor as Top_10.

#Q3
#Create two new independent variables: Top 2–5 and Top 6–10. 
#Top 2–5 represents the number of times the driver finished between second 
#and fifth place and Top 6–10 represents the number of times the driver 
#finished between sixth and tenth place. Develop an estimated regression 
#equation that can be used to predict Winnings ($) using Poles, Wins, 
#Top 2–5, and Top 6–10. Test for individual significance and discuss your 
#findings and conclusions.
model <- lm(Winnings ~ Poles + Wins + Top_2_5 + Top_6_10, data = nascar)
summary(model)
model$coefficients

#winnings = 3140367 + (-12939*Poles) + (202245*Wins) + (Top_2_5*188700) + 
#(Top_6_10*117071)

#Top_2_5 is very significant with a p-value of 6.43e-06 which is 0.
#Top_6_10 is significant with a p-value of 0.00147 which is below 0.01 (99% confident).
#Wins is significant with a p-value of 0.03254 which is below 0.05 (95% confident).

#Q4
#Based upon the results of your analysis, what estimated regression equation 
#would you recommend using to predict Winnings ($)? Provide an interpretation
#of the estimated regression coefficients for this equation.

#I would use the equation from question 3 as this offers more significant variables
#in comparison to the equation from question 2.



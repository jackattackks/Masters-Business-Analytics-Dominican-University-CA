# Q4
# look at windor OT m nonlinear r
install.packages('nloptr') #nonlinear opt in r

# clear the enviro
rm(list=ls())
library(nloptr)

# The following table shows the estimated daily profit from a new product for 
# several of the alternative choices for the production rate.

# prod rate (R)     profit per day (P)
# 0                 0
# 1                 95
# 2                 184
# 3                 255
# 4                 320

# Because the profit goes up less than proportionally with the production rate 
# (decreasing marginal returns), the management science team analyzing what this 
# production rate (and the pro- duction rates of some other products) should be 
# has decided to approximate the profit (P) by a simple nonlinear function of the
# production rate R.

#---------------------
# PART A
# One such approximation is P = $100R − $5R . How closely does this nonlinear 
# function approximate the five values of P given in the table?




#---------------------
# PART B
#Repeat part a for the approximation, P = $104R − $6 R2.

#---------------------
# PART C
# Which of these two nonlinear functions provides the better fit to all the data?

#---------------------
#PART D
# CAN SKIP CUZ GRAPHICAL ANALYSIS
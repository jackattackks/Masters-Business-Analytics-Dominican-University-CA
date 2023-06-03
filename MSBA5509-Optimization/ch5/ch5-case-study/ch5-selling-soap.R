# clear environment
rm(list=ls())

# import package 
library("lpSolve")

# set coefficients of obj function aka cost
f.obj <- c(1, 2)

# matrix of ads and products
f.con <- matrix(c(0.00, 0.01,
                  0.03, 0.02,
                  -0.01, 0.04),
                nrow = 3, byrow = TRUE)

# set inequality signs
f.dir <- c(">=",
           ">=",
           ">=")

# set parameters to right of inequality
f.par <- c(0.03,
           0.18,
           0.04)

# calculate final result aka total cost
lp_result <- lp("min", f.obj, f.con, f.dir, f.par)
lp_result

# print the final return, TV 4 and PM 3
vars <- lp_result$solution
vars

# PART A & B
# use graphical analysis to see what for each product 
# how much advertising cost would change if their respective minimum
# increase in sales was increased by 1 percent (without changing the others)

#change stain remover
f.par1 <- c(0.04,
           0.18,
           0.04)
lp_result_prod1 <- lp("min", f.obj, f.con, f.dir, f.par1)
lp_result_prod1

#original result, 4 TV and 3 print, 10mil cost
lp_result

#new result 3.33 TV, 4 Print, cost 11.33
vars1 <- lp_result_prod1$solution
vars1

lp_result
lp_result_prod1
#the cost difference is an increase of 1.33 million USD 
#when increasing the stain remover by 1%

# change liquid detergent
f.par2 <- c(0.03,
           0.19,
           0.04)
lp_result_prod2 <- lp("min", f.obj, f.con, f.dir, f.par2)
lp_result_prod2
lp_result

#new result 4.33 TV, 3 Print, cost 11.33
vars2 <- lp_result_prod2$solution
vars2
lp_result_prod2
lp_result

#the cost difference is 0.33 million USD increase
#when increasing the liquid detergent by 1%

# change powder detergent
f.par3 <- c(0.03,
           0.18,
           0.05)
lp_result_prod3 <- lp("min", f.obj, f.con, f.dir, f.par3)
lp_result_prod3
lp_result

vars3 <- lp_result_prod3$solution
vars3
lp_result_prod3
lp_result
# there is no cost difference when incresing the powder detergent by 1%


# PART C & D
# since using R not using solver in Excel

# disable scientific notation
#options(scipen = 100)

sensitivity_analysis <- lp("min", f.obj, f.con, f.dir, f.par, compute.sens = TRUE)
sensitivity_analysis

sensitivity_analysis$sens.coef.from
#lower limits 
#TV = 0.0000000
#Print = 0.6666667

sensitivity_analysis$sens.coef.to
#highest limits
# TV = 3
# Print = infinite

#PART E - increase simultaneasouly 
#shadow prices - constraint first, variables after - FOR TV AND PRINT
sensitivity_analysis$duals

# first 3 values are the product constraints,last 2 are the variables TV and print
# max values for stain = 133.33, liquid = 33.33, powder = 0

# for products
sensitivity_analysis$duals.from #lower limit
sensitivity_analysis$duals.to #upper limit

#PART F - SUMMARIZE

# PRODUCTION LIMITS
# TV: 0 - 3
# Print: 0.667 - Infinite

#PARAMETERS TO MINIMIZE COSTS
# Stain: 2.14%- 9%
# Liquid: 6% - 30%
# Powder: Infinite




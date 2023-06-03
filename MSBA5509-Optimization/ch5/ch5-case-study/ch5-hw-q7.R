# Clearing the Environment ----
rm(list=ls())
library(lpSolve)

# PART A

# oefficients of obj function
f.obj <- c(1,0.90,0.95)

# set constraint matrix
f.con <- matrix(c(0.45,0.5,0.4,
                  0.5,0.4,0.4,
                  0.1,0.15,0.2), nrow = 3, byrow = TRUE)

# set inequalities
f.dir <- c("<=",
           "<=",
           "<=")

# set parameters
f.par <- c(200,
           150,
           60)

# Solve model / profit
lp_solve <- lp("max", f.obj, f.con, f.dir, f.par)
lp_solve

# variabels
vars <- lp_solve$solution
vars

#PART B
#yes, will change, will increase profit besaure outside of allowable increase

f.objb <- c(1,0.90,1)
lp_solve_b <- lp("max", f.objb, f.con, f.dir, f.par)
lp_solve_b

# variabels
vars2 <- lp_solve_b$solution
vars2

# PART C
# yes, profit decreased
f.objC <- c(1,0.90,0.92)
lp_solve_C <- lp("max", f.objC, f.con, f.dir, f.par)
lp_solve_C

# variabels
vars3 <- lp_solve_C$solution
vars3

# PART D
#yes, profit decrease

# shadow price = financial implications of adding or subtracting a unit, 
#doesnt changing, this is the effect on objective value/total cost or profit

# set parameters
f.parD <- c(200,
           150,
           57)
# Solve model / profit
lp_solve_d <- lp("max", f.obj, f.con, f.dir, f.parD)
lp_solve_d

# variabels
vars4 <- lp_solve_d$solution
vars4

# PART E
# no it will exceed optimal solution


# PART F
options(scipen = 999)
sensitivity_analysis <- lp("max", f.obj, f.con, f.dir, f.par, compute.sens = TRUE)

# LOWER LIMITS 
sensitivity_analysis$sens.coef.from

# HIGHER LIMITS
sensitivity_analysis$sens.coef.to

# SHADOW PRICING
sensitivity_analysis$duals
sensitivity_analysis$duals.from # lower bound limitations
sensitivity_analysis$duals.to 


# Clearing the Environment ----
rm(list=ls())
library(lpSolve)

# set up problem

# set coefficients of obj function
f.obj <- c(45,70,50)

f.con <- matrix(c(40,80,90,
                  100,160,140,
                  190,240,160,
                  200,310,220), nrow = 4, byrow = TRUE)
f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

f.par <- c(25,
           45,
           65,
           80)

lp_solve <- lp("max", f.obj, f.con, f.dir, f.par)
lp_solve
#18.11 million USD

#mix quantity of buildings
vars <- lp_solve$solution
vars
# building 13.30%
# hotel 6.12%
# shopping center 15.64%


# a. The net present value of project 1 (a high-rise office
# building) increases by $200,000.

f.obja <- c(45.2,70,50)
lp_solve_a <- lp("max", f.obja, f.con, f.dir, f.par)
lp_solve_a
#18.12 million USD

#mix quantity of buildings
vars1 <- lp_solve_a$solution
vars1
# building 13.31%
# hotel 6.12%
# shopping center 15.65%

# b. The net present value of project 2 (a hotel) increases
# by $200,000.

f.objb <- c(45,70.2,50)
lp_solve_b <- lp("max", f.objb, f.con, f.dir, f.par)
lp_solve_b

#mix quantity of buildings
vars2 <- lp_solve_b$solution
vars2

# c. The net present value of project 1 decreases by
# $5 million.

f.objc <- c(40,70,50)
lp_solve_c <- lp("max", f.objc, f.con, f.dir, f.par)
lp_solve_c

#mix quantity of buildings
vars3 <- lp_solve_c$solution
vars3

# d. The net present value of project 3 (a shopping cen-
# ter) decreases by $200,000.

f.objd <- c(45,70,49.8)
lp_solve_d <- lp("max", f.objd, f.con, f.dir, f.par)
lp_solve_d

#mix quantity of buildings
vars4 <- lp_solve_d$solution
vars4

# e. All three changes in parts b, c, and d occur
# simultaneously.

f.obje <- c(40,70.2,49.8)
lp_solve_e <- lp("max", f.obje, f.con, f.dir, f.par)
lp_solve_e

#mix quantity of buildings
vars5 <- lp_solve_e$solution
vars5

# f. The net present values of projects 1, 2, and 3 change
# to $46 million, $69 million, and $49 million,
# respectively.

f.objf <- c(46,69,49)
lp_solve_f <- lp("max", f.objf, f.con, f.dir, f.par)
lp_solve_f

#mix quantity of buildings
vars6 <- lp_solve_f$solution
vars6

# g. The net present values of projects 1, 2, and 3 change
# to $54 million, $84 million, and $60 million,
# respectively.

f.objg <- c(54,84,60)
lp_solve_g <- lp("max", f.objg, f.con, f.dir, f.par)
lp_solve_g

#mix quantity of buildings
vars7 <- lp_solve_g$solution
vars7

# h. Use Solver to generate the sensitivity report for
# this problem. For each of the preceding parts, sup-
#   pose that the change occurs later without having the
# spreadsheet model immediately available on a com-
#   puter. Show in each case how the sensitivity report
# can be used to check whether the original optimal
# solution must still be optimal.

sensitivity_analysis <- lp("max", f.obj, f.con, f.dir, f.par, compute.sens = TRUE)
sensitivity_analysis$sens.coef.from
sensitivity_analysis$sens.coef.to

sensitivity_analysis$duals
sensitivity_analysis$duals.from
sensitivity_analysis$duals.to

# PART I -PARAMETER SOLVER - EXTRA

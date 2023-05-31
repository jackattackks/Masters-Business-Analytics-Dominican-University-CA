# Clearing the environment ----
rm(list=ls())

# Import lpSolve package ----
#install.packages("lpSolve")
library("lpSolve")

# PART A
#Formulate and solve a linear programming model to deter-
#mine the number of Family Thrillseekers and the number of
#Classy Cruisers that should be assembled.

#profit per model
f.obj <- c(3600, 5400)

#set constraints: hours, doors
f.con <- matrix(c(6, 10.5,
                  4, 2,
                  0, 1), nrow = 3, byrow = TRUE)

# Set inequality signs
# Set right-hand side parameters: labor, doors, demand
f.dir <- c("<=",
           "<=",
           "<=")

f.par <- c(48000,
           20000,
           3500)

# find profit
lp("max", f.obj, f.con, f.dir, f.par)

#find quantities of thrill seeker and cruiser
lp("max", f.obj, f.con, f.dir, f.par)$solution

# PART B
#The marketing department knows that it can pursue a targeted
#$500,000 advertising campaign that will raise the demand
#for the Classy Cruiser next month by 20 percent. Should the
#campaign be undertaken?

#no because an additional 20% exceeds the demand forecasted

#PART C
#Rachel knows that she can increase next month’s plant capac-
#ity by using overtime labor. She can increase the plant’s
#labor-hour capacity by 25 percent. With the new assembly
#plant capacity, how many Family Thrillseekers and how
#many Classy Cruisers should be assembled?

#48000 * 1.25 = 60000 new hours constraint

f.par <- c(60000,
           20000,
           3500)
lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

#she can assemble 3250 and 3500 respectively

#PART D
#Rachel knows that overtime labor does not come without an
#extra cost. What is the maximum amount she should be will-
#ing to pay for all overtime labor beyond the cost of this labor
#at regular-time rates? Express your answer as a lump sum.

#run this with the pre extra hours numbers and post extra hours to find 
#the difference
lp("max", f.obj, f.con, f.dir, f.par)

# 30600000 - 26640000 = 3960000 is the max she should spend

#PART E
#Rachel explores the option of using both the targeted adver-
#  tising campaign and the overtime labor-hours. The advertis-
#  ing campaign raises the demand for the Classy Cruiser by
#20 percent, and the overtime labor increases the plant’s labor-
#  hour capacity by 25 percent. How many Family Thrillseek-
#  ers and how many Classy Cruisers should be assembled
#using the advertising campaign and overtime labor-hours
#if the profit from each Classy Cruiser sold continues to be
#50 percent more than for each Family Thrillseeker sold?

#change to 4200 and 60000

#change from 3600 demand
f.par[3] <- 4200
lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

#PART F
#Knowing that the advertising campaign costs $500,000 and
#the maximum usage of overtime labor-hours costs $1,600,000
#beyond regular time rates, is the solution found in part e a
#wise decision compared to the solution found in part a?

#because the profit found in part e is more profitable than
#a by $3,660,000

#PART G
# Automobile Alliance has determined that dealerships are
# actually heavily discounting the price of the Family Thrill-
#   seekers to move them off the lot. Because of a profit-sharing
# agreement with its dealers, the company is not making a
# profit of $3,600 on the Family Thrillseeker but instead is
# making a profit of $2,800. Determine the number of Family
# Thrillseekers and the number of Classy Cruisers that should
# be assembled given this new discounted profit.

f.obj[1] <- 2800
#set back to normal
f.par <- c(48000,
           20000,
           3500)

lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

# PART H
# The company has discovered quality problems with the
# Family Thrillseeker by randomly testing Thrillseekers at the
# end of the assembly line. Inspectors have discovered that in
# over 60 percent of the cases, two of the four doors on a Thrill-
#   seeker do not seal properly. Because the percentage of defec-
#   tive Thrillseekers determined by the random testing is so high,
# the floor foreman has decided to perform quality control tests
# on every Thrillseeker at the end of the line. Because of the
# added tests, the time it takes to assemble one Family Thrill-
#   seeker has increased from 6 hours to 7.5 hours. Determine
# the number of units of each model that should be assembled
# given the new assembly time for the Family Thrillseeker.

f.obj[1] <- 3600
f.con[1, 1] <- 7.5
lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

# PART I
# The board of directors of Automobile Alliance wishes to cap-
#   ture a larger share of the luxury sedan market and therefore
# would like to meet the full demand for Classy Cruisers. They
# ask Rachel to determine by how much the profit of her assem-
#   bly plant would decrease as compared to the profit found in
# part a. They then ask her to meet the full demand for Classy
# Cruisers if the decrease in profit is not more than $2,000,000.
f.dir[3] <- "="
f.con <- matrix(c(6, 10.5,
                  4, 2,
                  0, 1), nrow = 3, byrow = TRUE)
lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

# PART J
# Rachel now makes her final decision by combining all the
# new considerations described in parts f, g, and h. What are
# her final decisions on whether to undertake the advertising
# campaign, whether to use overtime labor, the number of
# Family Thrillseekers to assemble, and the number of Classy
# Cruisers to assemble?

f.obj[1] <- 2800
f.con[1, 1] <- 7.5
f.par[1] <- 60000
f.par[3] <- 4200
lp("max", f.obj, f.con, f.dir, f.par)
lp("max", f.obj, f.con, f.dir, f.par)$solution

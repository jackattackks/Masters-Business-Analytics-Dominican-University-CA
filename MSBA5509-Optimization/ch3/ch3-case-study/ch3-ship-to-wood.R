
rm(list=ls())
library(lpSolve)

# option a cost by rail
f.obj <- c(61,	72,	45,	55,	66,
           69,	78,	60,	49,	56,
           59,	66,	63,	61,	47)

f.con <- matrix(c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
                  0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 
                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 
                  1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 
                  0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 
                  0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 
                  0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 
                  0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1  
), nrow = 8, byrow = TRUE)

f.dir <- rep("=", 8)

# constraint
f.par <- c(15,
           20,
           15,
           11,
           12,
           9,
           10,
           8)

option_1 <- lp("min", f.obj, f.con, f.dir, f.par)
print(option_1$solution)
print(option_1$objval)
#answer is 2816

# OPTION 2 BY WATER

f.obj <- c(58.5,	68.3,	47.8,	55.0,	63.5,
           65.3,	74.8,	55.0,	49.0,	57.5,
           59.0,	61.3,	63.5,	58.8,	50.0)

option_2 <- lp("min", f.obj, f.con, f.dir, f.par)
print(option_2$solution)
print(option_2$objval)

# OPTION 3 MIX 

f.obj <- c(58.5,	68.3,	45.0,	55.0,	63.5,
           65.3,	74.8,	55.0,	49.0,	56.0,
           59.0,	61.3,	63.0,	58.8,	47.0)

option_3 <- lp("min", f.obj, f.con, f.dir, f.par)
print(option_3$solution)
print(option_3$objval)

# option 3 would be the most cost effective
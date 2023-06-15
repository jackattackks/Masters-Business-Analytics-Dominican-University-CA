# 7.2. Reconsider the California Manufacturing Co. case study presented in Section 7.1. 
# The mayor of San Diego now has contacted the company’s president, Armando Ortega, 
# to try to persuade him to build a factory and perhaps a warehouse in that city.
# With the tax incentives being offered the company, Armando’s staff estimates that 
# the net present value of building a factory in San Diego would be $7 million and
# the amount of capital required to do this would be $4 million. The net present 
# value of building a warehouse there would be $5 million and the capital required 
# would be $3 million. (This option will only be considered if a factory also is 
# being built there.) 
# Armando has asked Steve Chan to revise his previous management science study 
# to incorporate these new alternatives into the overall problem. The objective 
# still is to find the feasible combination of investments that maximizes the 
# total net present value, given that the amount of capital available for these 
# investments is $10 million.

# Clearing the Environment ----
rm(list=ls())
library(lpSolve)

# PART A 
#Formulate a BIP model in algebraic form for this problem.

# X1: Factory in LA
# X2: Factory in SF
# X3: Factory in SD
# X4: Warehouse in LA
# X5: Warehouse in SF
# X6: Warehouse in SD

# Max NPV = 8X1 + 5X2 + 7X3 + 6X4 + 4X5 + 5x6 in Millions (Objective Function)

# constraints
# 
# 6X1 + 3X2 + 4X3 + 5X4 + 2X5 + 3X6 <= 10 (Capital Available in Millions)
# X4 +  X5  + X6 <= 1  (Mutually Exclusive: Only One Warehouse)
# -X1 +  X4 <= 0 (Contingent: X4 <= X1 Warehouse if Factory in LA)
# -X2 +  X5 <= 0 (Contingent: X5 <= X2 Warehouse if Factory in SF)
# -X3 + X6 <= 0 (Contingent: X6 <= X3 Warehouse if Factory in SD)

# X1, X2, X3, X4, X5, X6 = Binary Integer (yes or no)

# PART B
# Formulate and solve this model

f.obj <- c(8, 5, 7, 6, 4, 5)

f.con <- matrix(c(6, 3, 4, 5, 2, 3,
                  0, 0, 0, 1, 1, 1,
                  -1, 0, 0, 1, 0, 0,
                  0, -1, 0, 0, 1, 0,
                  0, 0, -1, 0, 0, 1), nrow = 5, byrow = TRUE)

# Set inequality signs
f.dir <- rep("<=",5)

# Set right-hand side parameters
f.par <- c(10, 1, 0, 0, 0)

# Solve the optimization problem and store the result
result <- lp("max", f.obj, f.con, f.dir, f.par, int.vec = 1:5, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value
objective_value <- result$objval

Print the final result
cat("Optimized solution:\n")
print(solution)

cat("\n Objective function value:", objective_value, "Millions")
# 
# FACTORY
# LA = NO
# SF = YES
# SD = YES
# 
# WAREHOUSE
# LA = NO
# SF = NO
# SD = YES






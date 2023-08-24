#Q5

# A real-estate development firm, Peterson and Johnson, is considering five 
# possible development projects. Using units of millions of dollars, the following
# table shows the estimated long- run profit (net present value) that each project
# would generate, as well as the amount of investment required to undertake the project.

# DEV PROJECT (millions)
#             1   2    3     4    5
# Est. profit 1   1.8  1.6   0.8  1.4
# cap reqd    6   12    10   4     8
# 
# The owners of the firm, Dave Peterson and Ron Johnson, have raised $20 million 
# of investment capital for these projects. Dave and Ron now want to select the 
# combination of projects that will maximize their total estimated long-run profit 
# (net present value) without investing more than $20 million.

#-------------------------
# PART A
# Formulate a BIP model in algebraic form for this problem.

# X1: Development 1
# X2: Development 2
# X3: Development 3
# X4: Development 4
# X5: Development 5
# Max NPV = 1X1 + 1.8X2 + 1.6X3 + 0.8X4 + 1.4X5 in Millions (Objective Function)

# Constraints
# 6X1 + 12X2 + 10X3 + 4X4 + 8X5 <= 20 (Capital Available in Millions)
# X1, X2, X3, X4, X5 = Binary Integer

#-------------------------
# PART B
# b. Formulate and solve this model on a spreadsheet.
f.obj <- c(1, 1.8, 1.6, 0.8, 1.4)
f.con <- matrix(c(6, 12, 10, 4, 8), nrow = 1, byrow = TRUE)

# Set inequality signs
f.dir <- c("<=")

# Set right-hand side parameters
f.par <- c(20)

result <- lp("max", f.obj, f.con, f.dir, f.par, int.vec = 1:1, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value
objective_value <- result$objval

# Print the final result
cat("Optimized solution:\n")
print(solution)

cat("\n Objective function value:", objective_value, "Millions")
# 
# DEV 1 YES
# DEV 2 NO
# DEV 3 YES
# DEV 4 YES
# DEV 5 NO
# NPV = 3.4 MIL


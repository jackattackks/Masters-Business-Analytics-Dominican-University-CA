# Q7  

#Formulate and solve a spreadsheet model with both integer variables
# and binary variables for this problem.

# X1: Customer 1
# X2: Customer 2
# X3: Customer 3
# Max Profit = -1X1 + 1X2 + 0.8X3 in Millions (Objective Function)

#constraints 
# 0.20X1 + 0.40X2 + 0.20X3 <= 1 capacity
#     X1 +        +        <= 3 max
#        +     X2 +        <= 2 max
#        +        +     X3 <= 5 max
# X1, X2, X3 = Binary Integer

f.obj <- c(-1,1,0.8)

f.con <- matrix(c(0.20,0.40,0.20,
                  1,0,0, # cust 1
                  0,1,0, #cust 2
                  0,0,1), #cust 3
                nrow = 4, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

f.par <- c(1,
           3,
           2,
           5)

# Solve the optimization problem and store the result
result <- lp("max", f.obj, f.con, f.dir, f.par, int.vec = 1:4, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value
objective_value <- result$objval

# Print the final result
cat("Optimized solution:\n")
print(solution)

cat("\n Objective function value:", objective_value, "Millions")

# cust 1 = no
# cust 2 = yes
# cust 3 = yes
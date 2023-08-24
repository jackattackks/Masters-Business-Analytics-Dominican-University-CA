# Q14, 18

# PART A
# Formulate a BIP model in algebraic form for this problem.

# X1: Project a
# X2: Project b
# X3: Project c
# X4: Project d
# X5: Project e
# Max NPV = 12X1 + 15X2 + 20X3 + 9X4 + 20X5 in Millions (Objective Function)
# Subject to (Constraints)
#  1X1 +  1X2 +      +     +      <= 2 (Project 1+2 together)
#      +      +  1X3 + 1X4 +      <= 1 (Either Project 3 or 4)
#  8X1 + 10X2 + 12X3 + 4X4 + 14X5 <= 40 (Year 1)
# 14X1 + 18X2 + 18X3 + 7X4 + 20X5 <= 65 (Year 2)
# 17X1 + 25X2 + 24X3 + 9X4 + 25X5 <= 81 (Year 3)
# 17X1 + 30X2 + 30X3 + 9X4 + 32X5 <= 93 (Year 4)
# X1, X2, X3, X4, X5 = Binary Integer

#-------------------------

# PART 
# Formulate and solve this model on a spreadsheet.

f.obj <- c(12,15,20,9,20)

f.con <- matrix(c(1,1,0,0,0,
                  0,0,1,1,0,
                  8,10,12,4,14,
                  14,18,18,7,20,
                  17,25,24,9,25,
                  17,30,30,9,32), nrow = 6, byrow = TRUE)

# Set inequality signs
f.dir <- rep("<=",6)

# Set right-hand side parameters
f.par <- c(2,
           1,
           40,
           65,
           81,
           93)


result <- lp("max", f.obj, f.con, f.dir, f.par, int.vec = 1:6, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value
objective_value <- result$objval

# Print the final result
cat("Optimized solution:\n")
print(solution)

cat("\n Objective function value:", objective_value, "Millions")

# Project a = YES
# Project b = YES
# Project c = NO
# Project d = YES
# Project e = YES

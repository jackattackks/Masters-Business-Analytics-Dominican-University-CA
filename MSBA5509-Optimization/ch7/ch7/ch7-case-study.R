# clear the enviro
rm(list=ls())
library(lpSolve)

# CONTRAINTS
# - max 1 collage
# min 1 3d wire 
# min 1 2d  computer generated drawing 
# min 1 photo realist painting
# min 1 expressionist painting
# min water color painting 
# max paintings = 2x all other art
# min 2 paint candy 
# min 1 piece david 
# min 1 piece rick rawls
# max 1 piece ziggy
# min 1 female piece when 2 male pieces shown
# min 1 aging earth and wasted resources
# min 1 bear canton
# min 1 chaos reigns, who has controls, beyond, pioneers
# max 4 sculptures
# max 20 total paint, collage, drawrings
# if narcissim shown, reflection must
# max 4million usd

# MODEL
# CZPerfection
# CZBurden
# CZEqualizer
# RLChaos
# RLControl
# RLDomestication
# RLInnocence
# NMAging
# NMWasted
# CTSerenity
# CTCalmStorm
# RBVoid
# RBSun
# DLStorefront
# DLHarley
# AOConsumerism
# AOReflection
# AOTrojan
# RRRick
# RRRickII
# RRRickIII
# BRBeyond
# BRPioneers
# BCWisdom
# BCSuperior
# BCLiving
# HRViolin
# HRFruit
# ZLNamesake
# ZLNarcissism
# ABGlitters
# ABRock
# ABWinding
# ABDreams

# max COST = 300000CZPerfection+250000CZBurden+125000CZEqualizer+
#  400000RLChaos + 500000RLControl + 400000RLDomestication+ 550000RLInnocence +
#   700000NMAging + 575000NMWasted + 
#   200000CTSerenity + 225000CTCalmstorm + 
#   150000RBVoid + 150000RBSun + 
#   850000DLStorefront + 750000DLHarley +
#   400000AOConsumerism + 175000AOReflection + 450000AOTrojan +
#   500000RRRick + 500000RRRickII + 500000RRRickIII + 
#   650000BRBeyond + 650000BRPioneers + 
#   250000BCWisdom + 350000BCSuperior + 450000BCLiving +
#   400000HRViolin + 400000HRFruit + 
#   300000ZLNamesake + 300000ZLNarcissism +
#   50000ABGlitters + 50000ABRock + 50000ABWinding + 50000ABDreams
  


# PART A
# Ash decides to allocate $4 million to fund the exhibit. Given
# the pieces available and the specific requirements from Ash
# and Celeste, formulate and solve a binary integer programming
# problem to maximize the number of pieces displayed in
# the exhibit without exceeding the budget. How many pieces
# are displayed? Which pieces are displayed?

# Set coefficients of the objective function
f.obj <- rep(1, 40)

# constraint matrix
f.con <- matrix(c(
  # Collage
  rep(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1), 2),
  # Wire-mesh and computerdrawing 
  rep(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1), 2),
  # Photo-realistic
  rep(c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0), 2), 
  # Cubist
  rep(c(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0), 2),
  # Expressionist
  rep(c(0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0), 2), 
  # Watercolor
  rep(c(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0), 2), 
  # Oil
  rep(c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0), 2), 
  # Painting and others
  rep(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1), 2),
  # David Lyman and Rick Rawls
  rep(c(1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 2),
  # Ziggy Lite 
  c(rep(0, 8), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
  # Gender female representation 
  rep(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1), 2),
  
  # Specific art pieces constraint
  c(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
  c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)
), nrow = 30, byrow = TRUE)

# Set inequality signs
f.dir <- rep("<=", 30)

# Set right-hand side parameters
f.par <- rep(1, 30)

# Solve the optimization problem and store the result
result <- lp("min", f.obj, f.con, f.dir, f.par, int.vec = 1:40, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value
objective_value <- result$objval

# Print the final result
cat("Optimized solution:\n")
print(solution)

# PART B
# To ensure that the exhibit draws the attention of the public, Celeste 
# decides that it must include at least 20 pieces.
# Formulate and solve a binary integer programming problem to minimize the 
# cost of the exhibit while displaying at least 20 pieces and meeting the 
# requirements set by Ash and Celeste. How much does the exhibit cost? 
# Which pieces are displayed?

f.obj <- c(300000, 250000, 125000, 400000, 500000, 400000, 550000, 700000, 575000,
           200000, 225000, 150000, 150000, 850000, 750000, 400000, 175000, 450000,
           500000, 500000, 500000, 650000, 650000, 250000, 350000, 450000, 400000,
           400000, 300000, 300000, 50000, 50000, 50000, 50000)

f.con <- matrix(c(
  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1
), nrow = 10, byrow = TRUE)

# Set inequality signs
f.dir <- c(
  ">=", "<=", "<=", "<=", "<=",
  "<=", "<=", "<=", "<=", "<="
)

# right side parameters min pieces to display
f.par <- c(20, 1, 1, 1, 1, 1, 1, 1, 1, 1)

# Solve the optimization problem and store
result <- lp("min", f.obj, f.con, f.dir, f.par, int.vec = 1:30, all.bin = TRUE)

# Variables final values
solution <- result$solution

# Objective function value (total cost)
objective_value <- result$objval

# Print the final result
cat("Optimized solution:\n")
print(solution)

# Print the exhibit cost
cat("Exhibit cost:", objective_value)

# PART C
# An influential patron of Rita Losky’s work who chairs the
# museum’s board of directors learns that Celeste requires at
# least 20 pieces in the exhibit. He offers to pay the minimum
# amount required on top of Ash’s $4 million to ensure that
# exactly 20 pieces are displayed in the exhibit and that all of
# Rita’s pieces are displayed. How much does the patron have
# to pay? Which pieces are displayed?

library(lpSolveAPI)
model <- make.lp(0, 30)

# Set the coefficients
set.objfn(model, c(300000, 250000, 125000, 400000, 500000, 400000, 550000, 700000,
                   575000, 200000, 225000, 150000, 150000, 850000, 750000, 400000,
                   175000, 450000, 500000, 500000, 500000, 650000, 650000, 250000,
                   350000, 450000, 400000, 400000, 300000, 300000))

# Set the direction of optimization (minimize)
set.objdir(model, "min")

# Set the variable type (binary)
set.type(model, 1:30, type = "binary")

# Add constraints
add.constraint(model, rep(1, 30), type = ">=", rhs = 20)
add.constraint(model, matrix(c(
  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0
), nrow = 10, byrow = TRUE), type = "<=", rhs = c(20, 1, 1, 1, 1, 1, 1, 1, 1, 1))

# Set the constraint to be exactly 20
set.constr.value(model, 1, 20)

# Solve the LP problem
solve(model)

# Get the optimized solution
solution <- get.variables(model)

# Get the objective function value (total cost)
objective_value <- get.objective(model)

# Print the final result
cat("Optimized solution:\n")
print(solution)

# Print the patron's payment
patron_payment <- objective_value - 4000000  # Subtract Ash's $4 million
cat("Patron's payment:", patron_payment)


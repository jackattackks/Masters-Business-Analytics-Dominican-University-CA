#PART A-E
# Clearing the Environment ----
rm(list=ls())

# Set Unit Revenue and Marginal Cost ----
unit_revenue <- 4500
marginal_cost <- 2000
# ADDED IN REVIEW fixed_cost <- 25000

# Create Quantity Column ----
quantity <- seq(0, 500, length.out = 6)

# Create Cost Columns ----
fixed_cost <- rep(250000, length(quantity))
variable_cost <- marginal_cost * quantity
total_cost <- fixed_cost + variable_cost

# Create Revenue Column ----
revenue <- unit_revenue * quantity

# Build data frame ----
df <- data.frame(quantity, fixed_cost, variable_cost, total_cost, revenue)

# Obtain break even quantity ----
break_even_quantity <- fixed_cost[1] / (unit_revenue - marginal_cost)
break_even_quantity

# Import ggplot2 and Tidyverse Package ----
library(ggplot2)
library(tidyverse)

# Build Break Even Point Graph ----
df %>%
  ggplot(aes(x = quantity)) +
  geom_line(aes(y = fixed_cost, col = "Fixed Cost"), size = 1, linetype = "dashed") +
  geom_line(aes(y = variable_cost, col = "Variable Cost"), size = 1) +
  geom_line(aes(y = total_cost, col = "Total Cost"), size = 2) +
  geom_line(aes(y = revenue, col = "Revenue"), size = 2) +
  geom_point(aes(x = break_even_quantity, y = break_even_quantity * unit_revenue),
             colour = "tomato", size = 4) +
  labs(x = "Quantity", y = "Dollars")

#FULL POINTS FOR A-E

#PART F-J
# Clearing the Environment ----
#rm(list=ls())

#from answers below for F
FC <- 300 * (unit_revenue - marginal_cost)
FC

#from answers below for G
MC <- (300 * unit_revenue - fixed_cost) / 300
MC

#from answers below for H

fixed_cost <- 375000
marginal_cost <- 3000

variable_cost <- marginal_cost * quantity
total_cost <- fixed_cost + variable_cost
revenue <- unit_revenue * quantity

df <- data.frame(quantity, fixed_cost, variable_cost, total_cost, revenue)
break_even_quantity <- fixed_cost / (unit_revenue - marginal_cost)
break_even_quantity

df %>%
  ggplot(aes(x = fixed_cost)) +
  geom_line(aes(y = quantity, col = "QTY"), size = 1, linetype = "dashed") +
  geom_line(aes(y = variable_cost, col = "Variable Cost"), size = 1) +
  geom_line(aes(y = total_cost, col = "Total Cost"), size = 2) +
  geom_line(aes(y = revenue, col = "Revenue"), size = 2) +
  geom_point(aes(x = break_even_quantity, y = break_even_quantity * unit_revenue),
             colour = "tomato", size = 5) +
  labs(x = "Quantity", y = "Dollars")

#part H
# Set Unit Revenue and Marginal Cost ----
unit_revenue <- 4500
marginal_cost <- 2000

# Create Quantity Column ----
quantity <- seq(0, 500, length.out = 6)

# Create Cost Columns ----
fixed_cost <- seq(250000, 1000000, length.out = 4)
quantity <- rep(200, length(fixed_cost))
variable_cost <- marginal_cost * quantity
total_cost <- fixed_cost + variable_cost

# Create Revenue Column ----
revenue <- unit_revenue * quantity

# Build data frame ----
df <- data.frame(quantity, fixed_cost, variable_cost, total_cost, revenue)

# Obtain break even quantity ----
break_even_quantity <- fixed_cost[1] / (unit_revenue - marginal_cost)
break_even_quantity

# Import ggplot2 and Tidyverse Package ----
library(ggplot2)
library(tidyverse)

# Build Break Even Point Graph ----
df %>%
  ggplot(aes(x = fixed_cost)) +
  geom_line(aes(y = quantity, col = "QTY"), size = 1, linetype = "dashed") +
  geom_line(aes(y = variable_cost, col = "Variable Cost"), size = 1) +
  geom_line(aes(y = total_cost, col = "Total Cost"), size = 2) +
  geom_line(aes(y = revenue, col = "Revenue"), size = 2) +
  geom_point(aes(x = break_even_quantity, y = break_even_quantity * unit_revenue),
             colour = "tomato", size = 5) +
  labs(x = "Quantity", y = "Dollars")

#I. around 1,400,000 or greater (2833)
#J. no it wouldnt | still profitable

#final score = 85
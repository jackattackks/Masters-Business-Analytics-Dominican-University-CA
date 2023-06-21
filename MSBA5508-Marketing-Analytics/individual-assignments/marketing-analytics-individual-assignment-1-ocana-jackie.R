# (1) create perceptual maps with using the dataset attached to this assignment. 
# (2) submit a document (word or pdf) on Moodle.
# (3) the document should include two perceptual maps 
# (unaggregated and aggregated ones) and your interpretations.
# (4) there is no formatting guideline. 

# clear environment
rm(list=ls())
library("readxl")
brand_percep <- read_excel("/Users/Jackie/Desktop/Masters-Business-Analytics-Dominican-University-CA/MSBA5508-Marketing-Analytics/individual-assignments/brand-percep.xlsx")
# -----------------
# Q1


# see begin and end of dataset
head(brand_percep)
tail(brand_percep)

# details per col
summary(brand_percep)
str(brand_percep)

# example
# x <- 1:1000
# x.sc <- (x - mean(x)) / sd(x)
# summary(x.sc)

# copy and transform to df
brand.scaled <- brand_percep
brand.scaled[, 1:9] <- data.frame(scale(brand_percep[, 1:9]))
summary(brand.scaled)

# import corrplot and cluster
library(corrplot)
corrplot(cor(brand.sc[, 1:9]), order="hclust")

# join by brands and aggregate mean
brand.mean <- aggregate(. ~ Brand, data=brand.scaled, mean)
brand.mean

rownames(brand.mean) <- brand.mean[, 1] # use brand for the row names
brand.mean <- brand.mean[, -1]          # remove brand name column
brand.mean

# import libraries
library(gplots)
library(RColorBrewer)

# heatmap
heatmap.2(as.matrix(brand.mean), 
          col=brewer.pal(9, "GnBu"), trace="none", key=FALSE, dend="none",
          main="\n\n\n\n\nBrand attributes")

brand.pc <- prcomp(brand.scaled[, 1:9])
summary(brand.pc)
plot(brand.pc, type="l")
biplot(brand.pc)

# means only
brand.mean
brand.mu.pc <- prcomp(brand.mean, scale=TRUE)
summary(brand.mu.pc)
biplot(brand.mu.pc, main="Brand positioning", cex=c(1.5, 1))

#NEED TO REVISE THIS
brand.mean["Adaptable",  ] - brand.mean["Papa", ]


# -------------------

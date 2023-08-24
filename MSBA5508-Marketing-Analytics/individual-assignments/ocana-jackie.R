rm(list=ls())

# slide 1
install.packages("conjoint")
library(conjoint)
data(tea)

data <- "tea"
attributes <- c("Price", "Variety", "Kind", "Aroma")
levels <- c("Low", "Medium", "High", "Black", "Green", "Red", "Bags", "Granulated", "Leafy", "Yes", "No")


head(data)
ls()
print(tprefm)
print(tpref)
print(tprof)
print(tlevn)
print(tsimp)

# slide 3
# Declare research variables
research_variables <- expand.grid(Price = levels[1:3], Variety = levels[4:6], Kind = levels[7:9], Aroma = levels[10:11])

factdesign<-caFactorialDesign(data= research_variables,type="fractional")
print(factdesign)
prof=caEncodedDesign(design=factdesign)
print(prof)

#verifying of the design quality (orthogonal)
print(round(cov(prof),5))
print(round(cor(prof),5))
print(det(cor(prof)))

# slide 4
## PART II- GET THE MEASUREMENT--------
#model estimation for an aggregate level
partutilities=caPartUtilities(y=tpref,x=tprof,z=tlevn)
print(partutilities)
totalutilities=caTotalUtilities(y=tpref,x=tprof)
print(totalutilities)
Conjoint(y=tpref,x=tprof,z=tlevn)

caImportance(y=tpref[1,],x=tprof)


# slide 5
seg<-caSegmentation(tpref,tprof)
print(seg$segm)
seg2<-caSegmentation(tpref,tprof,c=3)
print(seg2$segm)
summary(seg2)

require(fpc)
plotcluster(seg2$util,seg2$sclu)
str(seg2)

require(broom)
require(ggplot2)
dcf<-discrcoord(seg2$util,seg2$sclu)
assignments<-augment(seg2$segm,dcf$proj[,1:2])
ggplot(assignments)+geom_point(aes(x=X1,y=X2,color= .cluster))+labs(color="Cluster Assignment",title="K-Means Clustering Results")

# slide 6
ShowAllSimulations(sym=tsimp,y=tpref,x=tprof)

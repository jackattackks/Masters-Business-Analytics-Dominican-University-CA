library(readxl)
Percep <- read_excel("Percep.xlsx")
View(Percep)

brand.ratings<-Percep
head(brand.ratings)
tail(brand.ratings)
summary(brand.ratings)
str(brand.ratings)

x<-1:100
x.sc<-(x-mean(x)/sd(x))
summary(x.sc)

install.packages("corrplot")

brand.sc<-brand.ratings
brand.sc[,1:9]<-data.frame(scale(brand.ratings[,1:9]))

library(corrplot)
corrplot(cor(brand.sc[,1:9]), order = "hclust")

brand.mean <- aggregate(.~brand,data = brand.sc,mean)         

rownames(brand.mean)<-brand.mean[,1]
brand.mean<-brand.mean[,-1]
brand.mean

#install.packages("RColorBrewer")
#install.packages("gplots")

library(gplots)
library(RColorBrewer)

heatmap(as.matrix(brand.mean), col = brewer.pal(9, "GnBu"), trace = "none", 
        key = FALSE, dendrogram = "none", main="\n\n\n\n\nBrand Attributes")

brand.pc<-prcomp(brand.sc[,1:9])
summary(brand.pc)

biplot(brand.pc)

brand.mu.pc<-prcomp(brand.mean,scale=TRUE)
summary(brand.mu.pc)

biplot(brand.mu.pc)

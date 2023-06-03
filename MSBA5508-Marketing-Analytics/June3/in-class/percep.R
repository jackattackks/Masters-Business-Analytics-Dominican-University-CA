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

         
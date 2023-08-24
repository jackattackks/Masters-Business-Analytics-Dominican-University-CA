# example iclass()
# regression with categorical variables

library(readxl)
reg_data_with_cate <- read_excel("reg data with cate.xlsx")
View(reg_data_with_cate)

library(readxl)
reg_data <- read_excel("reg data.xlsx")
View(reg_data)

ls(reg_data_with_cate)
cate<-reg_data_with_cate

#dummy coding1
cate$large<-ifelse(cate$size=='large',1,0)
str(cate)
cate

#dummy coding2
install.packages("fastDummies")
library(fastDummies)
cate1<-dummy_cols(cate,select_columns = "size")
str(cate1)
cate1
summary(cate1)

library(dplyr)
cate1 = select(cate1, -9, -11)
cate1

#practice
cate<-dummy_cols(cate,select_columns = c("size", "type"))
str(cate)
cate = select(cate, -1,-2,-9,-11,-13)
str(cate)

model<-lm(pur~., data=cate)
summary(model)
# Clearing the environment ----
rm(list=ls())

library(readxl)
Choice_logi <- read_excel("Choice_logi.xlsx")
View(Choice_logi)

pass.df<-Choice_logi
pass.df$Promo<-factor(pass.df$Promo,levels = c("NoBundle", "Bundle"))
pass.df$Channel<-factor(pass.df$Channel,levels = c("Email", "Mail", "Park"))
pass.df$Pass<-factor(pass.df$Pass,levels = c("NoPass", "YesPass"))
summary(pass.df)

table(pass.df$Pass,pass.df$Promo)
table(pass.df$Pass,pass.df$Channel)

pass.m1<-glm(Pass ~ Promo , data = pass.df, family = binomial)
summary(pass.m1)

plogis(0.38879)
plogis(0.38879)/(1-plogis(0.38879))
exp(0.38879)

exp(coef(pass.m1))
exp(cofint(pass.m1))

install.packages("vcd") 
library(vcd)

doubledecker(table(pass.df))

pass.m2 <- glm(Pass ~ Promo + Channel, data = pass.df, family = binomial)
summary(pass.m2)

exp(coef(pass.m2))


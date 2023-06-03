# Clearing the environment ----
rm(list=ls())

library(readxl)
Choice_logi <- read_excel("Choice_logi.xlsx")
View(Choice_logi)

pass.df<-Choice_logi
pass.df$Promo<-factor(pass.df$Promo,levels = c("NoBundle", "Bundle"))
pass.df$Channel<-factor(pass.df$Channel,levels = c("Email", "Mail", "Park"))

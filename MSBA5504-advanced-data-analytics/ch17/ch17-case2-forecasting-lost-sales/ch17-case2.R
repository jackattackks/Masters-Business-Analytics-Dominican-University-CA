#Prepare a report for the managers of the Carlson Department Store that 
#summarizes your findings, forecasts, and recommendations. 
#Include the following:
  
#1.An estimate of sales for Carlson Department Store had there been no hurricane.

#2.An estimate of countywide department store sales had there been no hurricane.

#3. An estimate of lost sales for the Carlson Department Store for September 
#through December.

library(readxl)
library(tidyverse)
library(readxl)
library(lmtest)
library(ggplot2)
library(fpp2) 

# Clear the environment
rm(list = ls())

# Set the working directory
setwd("/Users/Jackie/Desktop/Masters-Business-Analytics-Dominican-University-CA/MSBA5504-advanced-data-analytics/data-files")

#carlson
carlson <-read_excel("carlsonsales.xlsx")
glimpse(carlson)

carl_ts <- ts(carlson$Sales, start=1, frequency = 4)
print(carl_ts)
autoplot(carl_ts) + xlab("Year") + ylab("Sales") 

carl_decomp <- decompose(carl_ts, type = "multiplicative" ) # we use multiplicative
autoplot(carl_decomp)
print(carl_decomp)

#county
county<- read_excel("countysales.xlsx")
glimpse(county)

county_ts <- ts(county$Sales, start=1, frequency = 4)
print(county_ts)
autoplot(county_ts) + xlab("Year") + ylab("Sales") 

county_decomp <- decompose(county_ts, type = "multiplicative" ) # we use multiplicative
autoplot(county_decomp)
print(county_decomp)


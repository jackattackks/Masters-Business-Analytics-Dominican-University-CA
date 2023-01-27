# loading packages
install.packages("readxl")
library("readxl")


#loading data file
exceldata <- read_excel("/Users/Jackie/Desktop/advanced-data-analytics/data-files/buckeyecreek.xlsx")
df=data.frame(exceldata)

# 1. compute descriptive statistics and construct a scatter diagram for the data. 
#Discuss your findings.
#summarize descriptive stats
summary(df)

#make a scatterplot
library(ggplot2)
ggplot(df, aes(x = `Population`, y = `Season.Pass.Holders`)) +
  geom_point()
#Population mean for the data set is 15738 and the median is 12675.
#Each zipcode has a mean of 128.3 season pass holders, but the median is 59 season
#pass holders per zip code
#It seems that the larger the popluation, the more season pass holders there are in 
#a zip code.

# 2. Using simple linear regression, develop an estimated regression equation that 
#could be used to predict the number of season pass holders in a zip code given the 
#total population of the zip code.
buckslr <- lm(`Season.Pass.Holders` ~ Population, data = df)
buckslr$coefficients
#season pass holders = 0.00918295x - -16.25836695

# 3. Test for a significant relationship at the .05 level of significance.
summary(buckslr)
#The population is  statistically significant with a p-value less then 0.05. 
#The value is <2e-16

# 4. Did the estimated regression equation provide a good fit?
#Yes, it did.

#5. Use residual analysis to determine whether the 
#assumed regression model is appropriate.

df$predicated <- fitted(buckslr)
df$residuals <- residuals(buckslr)
df$std_residuals <- rstandard(buckslr)
plot(df$residuals)

# 6. Discuss if/how the estimated regression 
# equation should be used to guide the marketing campaign.

#the more season pass holders there are in an area less likely to get new buyers
# 7. What other data might be useful to predict the 
# number of season pass holders in a zip code?

#income per household, age


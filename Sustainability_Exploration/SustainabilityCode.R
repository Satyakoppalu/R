#Importing tidyverse
library(tidyverse)

##Viewing the data
summary(nacountries)

## plotting the scatter plot for 3 countries in Asia
ggplot(data = nacountries) +
  geom_point(mapping = aes(x=Time, y = Unemployment, color = Country)) + 
  geom_line(mapping = aes(x=Time, y = Unemployment, color = Country))

## Finding the Pearson's coefficient
cor(nacountries$USA, nacountries$Time)

## performing SLR
usaobj <- lm(formula = nacountries$USA ~ nacountries$Time)
summary(usaobj)

#checking assumptions
usaresid<-resid(usaobj)
plot(usaobj)
mean(usaresid)

## Confidence intervals for slope
confint(usaobj, level = 0.95)

## Prediction and Confidence intervals for y intercept
y <-nacountries$USA
x <-nacountries$Time
tofind <- lm(y ~ x)
summary(tofind)
latestx = data.frame(x = 2020)
predict.lm(tofind, latestx, interval = "prediction")
predict.lm(tofind, latestx, interval = "confidence")


## Scatter plot to compare the regions
ggplot(data = RegionData) +
  geom_point(mapping = aes(x=Time, y = Unemployment_Rate, color = Region, shape=Region, size=Region)) 


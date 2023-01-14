#Importing data from Excel
library(readxl)
Kcountries <- read_excel("C:/Users/satya/Downloads/Kiva_Sample_2021_updated.xlsx")

## Installing tidyverse
install.packages("tidyverse")
library("tidyverse")

## Filtering for teh three selected countries from the data
Threecountries<-filter(Kcountries, country =="India" | country == "United States" | country == "Puerto Rico")

##Creating Boxplots
boxplot(Threecountries$loan_amount ~ Threecountries$country)

## Performing ANOVA
Kano <-aov(Threecountries$loan_amount ~ Threecountries$country)
anova(Kano)

## Finding the length, mean and standard deviation
aggregate(Threecountries$loan_amount, by=list(Threecountries$country), FUN= length)
aggregate(Threecountries$loan_amount, by=list(Threecountries$country), FUN= mean)
aggregate(Threecountries$loan_amount, by=list(Threecountries$country), FUN= sd)


## Performing TukeyHSD Analysis
TukeyHSD(Kano, conf.level = 0.95)

## Installing pgrimess
install.packages("pgirmess")
library("pgirmess")

## Performing the kruskal wallace test for Multiple Comparisons
kruskal.test(Threecountries$loan_amount ~ Threecountries$country)
pgirmess::kruskalmc(Threecountries$loan_amount ~ Threecountries$country)
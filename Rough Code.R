echo "# STD_AT2_Code" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/JKaur1992/STD_AT2_Code.git
git push -u origin master


setwd("C:/Users/jkaur/Desktop/MDSI/Statistical Thinking/AT2/Data")

library(tidyverse)
library(Amelia)
library(readxl)
library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('mice') # imputation
library('randomForest') # classification algorithm
library(gtools) # for discretisation
library(corrplot)
library(Hmisc)
library(devtools)
library(PerformanceAnalytics)
library(FactoMineR)

################################
## Load the Crime data
################################

Alcohol_Assualts <- read.csv("EDITED - Incidents of Assault (Non-domestic assault) occurring during Weekends Nights from January 2009 to December 2018.csv")
Domestic_Violence <- read.csv("EDITED - Incidents of Assault occurring during Weekends Nights on Residential Premises from January 2009 to December 2018.csv")
postcode_data <- read_csv("PostcodeData2018.csv")
Alcohol_Violence <- read_excel("Alcohol Related Violence.xls")

################################
## Basic Data Read
################################

summary(Alcohol_Assualts)
dim(Alcohol_Assualts)
str(Alcohol_Assualts)
names(Alcohol_Assualts)

summary(Domestic_Violence)
dim(Domestic_Violence)
str(Domestic_Violence)
names(Domestic_Violence)

sumamry(postcode_data)
dim(postcode_data)
str(postcode_data)
names(postcode_data)

#NEED TO ADD A COLUMN for violence type and then MERGE the datasets
rbind(Alcohol_Assualts, Domestic_Violence)

##################################################
## Check for missing values
##################################################

missmap(Alcohol_Assualts, col=c("blue", "red"), legend=FALSE)
missmap(Domestic_Violence, col=c("blue", "red"), legend=FALSE)
missmap(postcode_data, col=c("blue", "red"), legend=FALSE)

##OR

missmap(Alcohol_Assualts, main = "Missing values vs observed")
missmap(Domestic_Violence, main = "Missing values vs observed")
missmap(postcode_data, main = "Missing values vs observed")

########################################
##Data engineering
########################################

# select() allows you to rapidly zoom in on a useful subset using operations based on the names of the variables. 
select(postcode_data, Postcode, May 2014)
select(flights, year:day)
select(flights, -(year:day))

# Create a subset for Variable=X and Variable=Y
sub = subset(postcode_data, Offence category == "Liquor", select = Postcode:Dec 2018) ##NEED TO SWAP SPACES WITH _
str(sub)

############################################
##EDA
############################################

plot(Alcohol_Assualts$LGA)

ggplot(Alcohol_Violence, aes(x = Year to December 2015, fill = default)) +
  geom_bar() +
  labs(x = '2015') +
  theme_excel()

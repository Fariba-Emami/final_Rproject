#install the renv for lock the version of the file for working as a collabration 

install.packages("renv")
install.packages("tidyverse")

library(dplyr)
library(ggplot2)
library(tidyverse)

#Part 1: Understanding the Dataset
#load the data
#Contains data on fuel consumption and performance of various cars.
data(mtcars)  
head(mtcars)
summary(mtcars)
str(mtcars)


#Part 3: Data Cleaning & Transformation

#Check for missing values
summary(mtcars) 
is.na(mtcars)
sum(is.na(mtcars))


#clean the data
mtcars_cleaned <- na.omit(mtcars)


#Transform at least one variable
#create a new column km_per_liter that converts miles per gallon (mpg) to kilometers per liter.
# Convert mpg to km per liter (1 mpg ≈ 0.425 km/l)

#creat a new colums
mtcars$km_per_liter <- mtcars$mpg * 0.425

#Normalize a Feature
#Normalize the hp (horsepower) column to have values between 0 and 1.
# Normalize the hp column

mtcars$hp_normalized <- (mtcars$hp - min(mtcars$hp)) / (max(mtcars$hp) - min(mtcars$hp))

summary(mtcars_cleaned)



#Part 4: Data Visualization & Insights





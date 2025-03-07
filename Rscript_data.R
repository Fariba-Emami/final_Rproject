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

#Plot 1: Fuel Efficiency (mpg) by Car Model
#This plot shows the fuel efficiency (miles per gallon) for each car model.


ggplot(mtcars, aes(x = reorder(rownames(mtcars), mpg), y = mpg)) +
    geom_bar(stat = "identity", fill = "pink") +
    labs(title = "Fuel Efficiency by Car Model",
         x = "Car Model",
         y = "Miles per Gallon (mpg)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
# Insights
# 1. The Toyota Corolla and Fiat 128 have the highest fuel efficiency.


#Plot 2: Correlation Between Horsepower (hp) and Weight (wt)
#This scatter plot explores the relationship between horsepower and weight.

ggplot(mtcars, aes(x = wt, y = hp)) +
    geom_point(color = "darkorange", size = 3) +
    geom_smooth(method = "lm", color = "red", se = FALSE) +
    labs(title = "Correlation Between Horsepower and Weight",
         x = "Weight (1000 lbs)",
         y = "Horsepower (hp)") +
    theme_minimal()
# Insights
# 1. There is a positive correlation between horsepower and weight.





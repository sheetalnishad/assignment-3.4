# Assignment 3_4 - Session 3

#Q1: Import the Titanic Dataset from the link Titanic Data Set.
#Perform the following:
#  a. Preprocess the passenger names to come up with a list of titles that represent families
#  and represent using appropriate visualization graph.
#  b. Represent the proportion of people survived from the family size using a graph.
#  c. Impute the missing values in Age variable using Mice Library, create two different
#graphs showing Age distribution before and after imputation.

#Solution 1:
#a)
#Importing the titanic dataset.
library(readxl)
titanic <- read_xls("titanic3.xls")
#b)
library(ggplot2)
ggplot(data = titanic) + geom_bar(mapping = aes(x = survived))

#c)
sum(is.na(titanic$age))
# Total 263 missing values in age variable of titanic dataset
#install.packages("mice")
library(mice)
md.pattern(titanic)
mice_imp <- mice(titanic, m=5, maxit = 40)
titanic_imp <- complete(mice_imputes,5)
sum(is.na(titanic_imp$age))
#distribution before and after imputation
hist(titanic$age, main='Original Age histogram ', col = "blue")
hist(titanic_imp$age, main="Imputed Age histogram", col="green")


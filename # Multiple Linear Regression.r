# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups')
library(readxl)

Data_gfg <- read_excel("X50_Startups.xlsx")

Data_gfg
Data_gfg <- read_excel("X50_Startups.xlsx")
library("readxl")
 dataset = read_excel("C:/Users/kaust/Downloads/50_Startups.xlsx")


# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training Set
regressor = lm(formula = Profit ~ .,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)




#Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R&D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)


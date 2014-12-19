
require(Hmisc)

train <- read.csv('train.csv', stringsAsFactors = F)

train$Sex <- as.factor(train$Sex)
train$Pclass <- as.factor(train$Pclass) 
train$Age <- as.integer(train$Age)

train$AgeSlice <- cut2(train$Age, cuts = c(0, 18, 35, 60, 90))
train$FareSlice <- cut2(train$Fare) 
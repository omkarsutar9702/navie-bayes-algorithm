library(tidyverse)
library(caret)
library(ggplot2)
library(randomForest)
library(e1071)
library(mice)
library(Amelia)

df <- read.csv("D:/R files/R_file/class work/StudentsPerformance.csv", stringsAsFactors=TRUE)

head(df)
str(df)

sum(is.na(df))
missmap(df)


index<-createDataPartition(df$test.preparation.course , p=0.80,list = FALSE)
train<-df[index,]
test<-df[-index,]

model=naiveBayes(test.preparation.course~.,data = train)
model


pred=predict(model,newdata=test)
cm=table(test$test.preparation.course,pred)
confusionMatrix(cm)

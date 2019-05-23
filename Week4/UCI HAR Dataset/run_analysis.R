rm(list = ls())
setwd("~/Estudos/Data Science/Getting-and-Cleaning-Data/Week4/UCI HAR Dataset/")
library(data.table)
library(dplyr)
library(reshape2)

activity_labels <- data.table::fread("./activity_labels.txt")[[2]]
features <- data.table::fread("./features.txt")[[2]]

x_train <- data.table::fread("./train/X_train.txt", col.names = features)
y_train <- factor(data.table::fread("./train/y_train.txt")[[1]], labels = activity_labels)
subject_train <- data.table::fread("./train/subject_train.txt")[[1]]
train <- data.table::data.table(subject = subject_train, activity = y_train, x_train)

x_test <- data.table::fread("./test/X_test.txt", col.names = features)
y_test <- factor(data.table::fread("./test/y_test.txt")[[1]], labels = activity_labels)
subject_test <- data.table::fread("./test/subject_test.txt")[[1]]
test <- data.table::data.table(subject = subject_test, activity = y_test, x_test)

data_set <- rbind(train,test)
data_set <- arrange(data_set, subject, activity)

mean_std <- grep("mean|std", features,value = TRUE)
data_set_mean_std <- data_set[,..mean_std]

data_set_tidy <- data_set %>% 
  melt(,id.vars = c("subject", "activity"), measure.vars = features) 

data_set_tidy <- data_set_tidy[, mean(value), by= c("subject", "activity", "variable")]
names(data_set_tidy) <- c("subject", "activity", "variable", "value")
data_set_tidy <- arrange(data_set_tidy, subject, activity, variable)

length(unique(data_set_tidy$variable))
length(unique(data_set_tidy$activity))
length(features)


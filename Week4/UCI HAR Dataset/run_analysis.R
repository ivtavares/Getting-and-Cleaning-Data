run_analysis <- function(){
  library(data.table)
  library(dplyr)
  library(reshape2)
  
  activity_labels <- data.table::fread("./activity_labels.txt")[[2]]
  features <- data.table::fread("./features.txt")[[2]]
  
  x_train <- data.table::fread("./train/X_train.txt", col.names = features)
  y_train <- factor(data.table::fread("./train/y_train.txt")[[1]], labels = activity_labels)
  subject_train <- data.table::fread("./train/subject_train.txt")[[1]]
  train <- data.table(subject = subject_train, activity = y_train, x_train)
  
  x_test <- data.table::fread("./test/X_test.txt", col.names = features)
  y_test <- factor(data.table::fread("./test/y_test.txt")[[1]], labels = activity_labels)
  subject_test <- data.table::fread("./test/subject_test.txt")[[1]]
  test <- data.table(subject = subject_test, activity = y_test, x_test)
  
  data_set <- rbind(train,test)
  mean_std <- c("subject","activity",grep("mean|std", features,value = TRUE))
  data_set <- data_set[,..mean_std]
  measure_vars <- mean_std[-1:-2]
  data_set <- melt(data_set, id.vars = c("subject", "activity"), measure.vars = measure_vars) 
  
  
  data_set_mean <- data_set[ , mean(value), by = c("subject", "activity", "variable")]
  names(data_set_mean) <- c("subject", "activity", "variable", "value")
  
  data_set <- arrange(data_set, subject, activity, variable)
  data_set_mean <- arrange(data_set_mean, subject, activity, variable)
  
  return(data_set_mean)
}

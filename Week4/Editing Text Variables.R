rm(list = ls())
setwd("~/Estudos/Data Science/Getting-and-Cleaning-Data/Week4/")
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accesstype=Download"
download.file(fileURL, destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)
tolower(names(cameraData))
splitnames <- strsplit(names(cameraData), "\\.")
splitnames[[5]]
splitnames[[6]]

mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

splitnames[[6]][1]

firstElement <- function(x){x[1]}
sapply(splitnames, firstElement)

fileUrl1 <- "https://raw.githubusercontent.com/ivtavares/courses/master/03_GettingData/04_01_editingTextVariables/data/reviews.csv"
fileUrl2 <- "https://raw.githubusercontent.com/ivtavares/courses/master/03_GettingData/04_01_editingTextVariables/data/solutions.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)
sub("_","",names(reviews))

testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
grep("Alameda", cameraData$intersection, value = TRUE)
grep("JeffStree", cameraData$intersection)
length(grep("JeffStree", cameraData$intersection))

library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff    ")

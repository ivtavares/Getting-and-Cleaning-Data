rm(list = ls())
setwd('~/Estudos/Data Science/Getting-and-Cleaning-Data/Week3/')
library('plyr')
library('dplyr')

if(!file.exists("./data")){dir.create("./data")}
fileUrl1 <- "http://www.sharecsv.com/dl/e70e9c289adc4b87c900fdf69093f996/reviews.csv"
fileUrl2 <- "http://www.sharecsv.com/dl/0863fd2414355555be0260f46dbe937b/solutions.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews)
head(solutions)

names(reviews)
names(solutions)

mergedData <- merge(reviews, solutions, by.x = "solution_id", by.y = "id", all = TRUE)
head(mergedData)

intersect(names(solutions), names(reviews))

mergedData2 <- merge(reviews, solutions, all = TRUE)
head(mergedData2)

df1 <- data.frame(id = sample(1:10), x = rnorm(10))
df2 <- data.frame(id = sample(1:10), y =rnorm(10))
arrange(join(df1,df2), id)

df1 <- data.frame(id = sample(1:10), x = rnorm(10))
df2 <- data.frame(id = sample(1:10), y = rnorm(10))
df3 <- data.frame(id = sample(1:10), z = rnorm(10))
dfList <- list(df1, df2, df3)
join_all(dfList)

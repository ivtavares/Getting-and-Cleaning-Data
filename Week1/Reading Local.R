rm(list = ls())
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile ="cameras.csv")
cameraData <- read.table("cameras.csv", sep = ",", header = TRUE)
head(cameraData)

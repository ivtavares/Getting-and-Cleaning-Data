rm(list = ls())
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile ="cameras.csv")
cameras <- read.csv("cameras.csv")
head(cameras)
list.files()
dateDownloaded <- date()
dateDownloaded

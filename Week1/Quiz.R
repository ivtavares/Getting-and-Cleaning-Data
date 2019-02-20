rm(list = ls())
library("data.tables")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url = fileURL,destfile = "housing.idaho.csv")
housing <- read.table(file = "housing.idaho.csv",header = TRUE, sep = ",")
nrow(housing[(housing$VAL==24 & !is.na(housing$VAL)),]) 
housingframe <- read.csv("housing.idaho.csv")
head(housingframe[housingframe$VAL==24,])
nrow(complete.cases())

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL,"NaturalGas.xlsx")
install.packages("xlsx")
library("xlsx")
dat <- read.xlsx("NaturalGas.xlsx", sheetIndex = 1,  rowIndex = 18:23, colIndex = 7:15,  header = TRUE)
head(NaturalGas)
sum(dat$Zip*dat$Ext,na.rm=T)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL,"restaurants.xml")
library(XML)
rest <- xmlTreeParse("restaurants.xml",useInternalNodes = TRUE)
rest
rootNode <- xmlRoot(rest)
xmlName(rootNode)
zipcode <- getNodeSet(rootNode,'//zipcode')
zipcode <- xmlSApply(zipcode,xmlValue)
length(which(zipcode==21231))

rm(list=ls())
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL,'communitysurvey.csv')
library(data.table)
DT <- fread(file = 'communitysurvey.csv')
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) 
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

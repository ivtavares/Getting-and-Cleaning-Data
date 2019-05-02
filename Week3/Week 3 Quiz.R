library("dplyr")
library("tidyr")
rm(list = ls())
setwd('~/Estudos/Data Science/Getting-and-Cleaning-Data/Week3/')
#1
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "communites.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", destfile = "communites.pdf")

communites <- read.csv("communites.csv")
communites <- as_tibble(communites)
head(communites)

agricultureLogical <- communites$ACR == 3 & communites$AGS == 6 
which(agricultureLogical)

#2
library("jpeg")
picture <- jpeg::readJPEG("getdata_jeff.jpg", native = TRUE)
quantile(picture, c(0.3, 0.8)) - c(638,0)

#3
rm(list = ls())
library("data.table")
GDP <- data.table::fread('GDP.csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)


EDSTATS <- data.table::fread("EDSTATS.csv")


GDP_EDSTATS <- merge(GDP, EDSTATS, by = "CountryCode", all = FALSE)
GDP_EDSTATS[order(-GDP_EDSTATS$Rank),1:5][13,]

#4
colnames(GDP_EDSTATS)[6] <- "Income_Group"
GDP_group <- GDP_EDSTATS %>% 
  group_by(Income_Group) %>% 
  summarize(GPD = mean(Rank)) %>% 
  print()
#5
breaks <- quantile(GDP_EDSTATS$Rank, seq(0, 1, 0.2), na.rm = TRUE)
GDP_EDSTATS$quantileGDP <- cut(GDP_EDSTATS$Rank, breaks = breaks)  
GDP_EDSTATS[Income_Group == "Lower middle income", .N, by = c("Income_Group","quantileGDP")]

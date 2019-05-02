rm(list = ls())
setwd("~/Estudos/Data Science/Getting-and-Cleaning-Data/Week2")
library(httr)
library(httpuv)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "0e2139d207977ab2caa8",
                   secret = "2ce12311c1c7cf3159999e8c204dd6a9303b50dd"
)
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = FALSE)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "acs.csv")

acs <- read.csv("acs.csv")
head(acs)
unique(acs$AGEP)

url <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(url)
close(htmlcode)
nchar(htmlcode)[c(10, 20, 30, 100)]

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "wkst.for")
url <- 
SST <- read.fwf("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", skip = 4, widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4))
SST
sum(SST$V4)



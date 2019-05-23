rm(list = ls())
setwd("~/Estudos/Data Science/Getting-and-Cleaning-Data/Week4/")
install.packages("swirl")
library(swirl)
swirl()
Igor
1
2
4
1
install_course("R Programming")
install_course("Getting and Cleaning Data")
Sys.getlocale("LC_TIME")
library(lubridate)
help(package = lubridate)
this_day <- today()
this_day
year(this_day)
wday(this_day)
wday(this_day, label = TRUE)
this_moment <- now()
this_moment
hour(this_moment)
my_date <- ymd("1989-05-17")
my_date
class(my_date)
ymd("1989 May 17")
mdy("March 12, 1975")
dmy(25081985)
ymd("1920/1/2")
dt1
ymd_hms(dt1)
hms("03:22:14")
dt2
ymd(dt2)
update(this_moment, hours = 8, minutes = 34, seconds = 55)
this_moment
this_moment <- update(this_moment, hours = 23, minutes = 18)
this_moment
?now
nyc <- now(tzone = "America/New_York")
nyc
depart <- nyc + days(2)
depart
depart <- update(depart, hours = 17, minutes = 34)
depart
arrive <- depart + hours(15) + minutes(50)
?with_tz
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong")
arrive
last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
?interval
how_long <- interval(last_time, arrive)
as.period(how_long)
stopwatch()
1
iv_tavares@yahoo.com.br
SeUH8ptTLLZdKDbn

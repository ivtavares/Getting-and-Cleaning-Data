rm(list = ls())
library(httr)
install.packages('rjson')
library('rjson')
myapp <- oauth_app("twitter", key = "BZzSHR88APIPPoHCV0bHwbiHv", secret = "7s7tHnm8AJjWYgcnCgjdUaTkIid5nCYSHAfkwdtqqPM2kOgmXa")
sig <- sign_oauth1.0(myapp, token = "57534887-4CzAvyNXYx25YzYySFYIaA52op6jkEilK84iiJjsY", 
                     token_secret = "TpMYeI1G5Zwj3bMlFCv7P002ldKFMLxhbuOrKnGuh9xD3")
homeTL <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
homeTL
json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))

rm(list = ls())
setwd('~/Estudos/Data Science/Getting-and-Cleaning-Data/Week3/')
library('swirl')
swirl()
Igor
3
10
2
library(dplyr)
cran <- tbl_df(mydf)
cran <- as_tibble(mydf)
rm("mydf")
cran
?group_by
by_package <- group_by(cran, package)
by_package
summarize(by_package, mean(size))

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

pack_sum
quantile(pack_sum$count, probs = 0.99)
top_counts <- filter(pack_sum, count > 679)
top_counts
View(top_counts)
top_counts_sorted <- arrange(top_counts, desc(count))
View(top_counts_sorted)

quantile(pack_sum$unique, probs = 0.99)
top_unique <- filter(pack_sum, unique > 465)
View(top_unique)
top_unique_sorted <- arrange(top_unique, desc(unique))
View(top_unique_sorted)
                             
View(result3)
2
iv_tavares@yahoo.com.br
aItRmm3OPyeskFGi

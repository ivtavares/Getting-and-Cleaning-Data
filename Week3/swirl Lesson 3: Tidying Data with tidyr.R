rm(list = ls())
setwd('~/Estudos/Data Science/Getting-and-Cleaning-Data/Week3/')
library('swirl')
swirl()
Igor
4
3
1
3
1
library(tidyr)
6
students
?gather
gather(students, sex, count, -grade)

students2
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(data = res, col = sex_class, into = c("sex", "class"))

students3

library(readr)
parse_number("class5")

students4

passed
failed
passed <- passed %>% mutate(status = 'passed')
failed <- failed %>% mutate(status = 'failed')
?bind_rows
bind_rows(passed, failed)

sat
iv_tavares@yahoo.com.br
qdZ0rSPO7TXcqcKt

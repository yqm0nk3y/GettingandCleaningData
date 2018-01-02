#Q1
#install.packages("httpuv")
#https://stackoverflow.com/questions/30819293/authorization-code-for-github-api-used-in-r

library(httr)
library(httpuv)
library(jsonlite)
oauth_endpoints("github")
myapp <- oauth_app("RGithub",
                   key = "c6cc9482dd2ed487bd86",
                   secret = "46a2f89afcd61cc7fbd45c61ce04ad667266b306")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = FALSE)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
#content(req)
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
json1 <-fromJSON(toJSON(content(req)))
json2 <- json1[json1$name == "datasharing",]
json2$created_at


#Q3

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])


#Q5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
d <- read.fwf(url, w, header = FALSE, skip = 4)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])

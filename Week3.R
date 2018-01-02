# subsetting

set.seed(13435)
X<-data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X<- X[sample(1:5),];
X$var2[c(1,3)]=NA
X

# get rid of missing value with which
X[which(X$var2 > 8),]

#sorting
sort(X$var1)


sort(X$var1, decreasing = TRUE)

#order all the records with var1
X[order(X$var1),]
X[order(X$var1, X$var3),]

#install.packages("plyr")
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))

## summarizing data

url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile = "./data/restaurant.csv")
restData <- read.csv("./data/restaurant.csv")

head(restData,3)
tail(restData, n= 3)
summary(restData)
str(restData)

table(restData$zipCode, useNA="ifany")

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)

#row and column sums
colSums(is.na(restData))


# create sequence
s1 <- seq(1,10,by=2)


install.packages("reshape2")
library(reshape2)


# working with data frames
install.packages("dplyr")
library(dplyr)

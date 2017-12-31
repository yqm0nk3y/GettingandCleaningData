#Q1
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/Q1.csv")

Q1Data <- read.csv("./data/Q1.csv")

Q1SubData <- Q1Data[Q1Data$VAL == 24 & !is.na(Q1Data$VAL), ]
NROW(Q1SubData)


#Q2 Tidy data has one variable per column.

#Q3
library(xlsx)
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/Q3.xlsx", mode="wb")
ColIndex= 7:15
RowIndex = 18:23
dat <- read.xlsx(file = "./data/Q3.xlsx", sheetIndex = 1, colIndex = ColIndex, rowIndex = RowIndex, header = TRUE)
sum(dat$Zip*dat$Ext,na.rm=T)

#Q4
library(XML)
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "./data/Q4.xml", mode = "wb")
doc <- xmlTreeParse("./data/Q4.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zipCode <- xpathSApply(rootNode,"//zipcode", xmlValue)
NROW(zipCode[zipCode == 21231])

#Q5
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/Q5.csv")
dateDownloaded <- date()

DT <- fread("./data/Q5.csv", sep = ",")
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

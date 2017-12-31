setwd("./Gettingandcleaningdata")
getwd()

if(!file.exists("data"))
{
   dir.create("data")
}

#download file from internet
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=Download"

download.file(fileUrl, destfile = "./data/cameras.csv")
list.files("./data")

dateDownloaded <- date()
dateDownloaded

# read local flat files
cameraData <- read.table("./data/cameras.csv", sep=",", header = TRUE)
head(cameraData)

# read csv call read.table within
cameraData <- read.csv("./data/cameras.csv")
cameraData

# read xls
install.packages("xlsx")
library(xlsx)
# load particular row and column
colIndex <- 2:3
rowIndex <- 1:4
cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1,colIndex = colIndex, rowIndex = rowIndex, header = TRUE)
cameraData

#read XML
install.packages("XML")
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
download.file(fileUrl, destfile = "./data/simple.xml")
doc <- xmlTreeParse(file = "./data/simple.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

# all the nested element within
names(rootNode)
# first component
rootNode[[1]]
rootNode[[1]][[1]]

# loop through all the xml element and get xml value
xmlSApply(rootNode, xmlValue)


#read JSON
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login


# data table
install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y = rep(c("a", "b", "c"), each = 3), z= rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9), y = rep(c("a", "b", "c"), each = 3), z= rnorm(9))
tables()
DT
#subsetting rows
DT[2,]
DT[DT$y=="a",]

#column subsetting
DT[,list(mean(x), sum(z))]

# add new columns
DT[,w:=z^2]
DT

# multiple operations
DT[, m:={tmp<-(x+2); log2(tmp+5)}]
DT



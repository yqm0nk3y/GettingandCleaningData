## R My SQL
#install.packages("RMySQL", type="source")
library(RMySQL)
ucscDb <- dbConnect(MySQL(), username="genome", host="genome-mysql.cse.ucsc.edu")

result <- dbGetQuery(ucscDb, "show databases;")

print(result)



dbDisconnect(ucscDb)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19",  host="genome-mysql.cse.ucsc.edu")

allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19,"affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")


query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affMis <- fetch(query)
quantile(affMis$misMatches)
affMisSmall <- fetch(query, n = 10)
#important
dbClearResult(query)


dbDisconnect(hg19)

## R HDF5
#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

library(rhdf5)
created = h5createFile("./data/example.h5")
created

h5createGroup("./data/example.h5", "foo")
h5createGroup("./data/example.h5", "baa")
h5createGroup("./data/example.h5", "foo/foobaa")

h5ls("./data/example.h5")

A = matrix(1:10, nr =5, nc= 2)
h5write(A,"./data/example.h5", "foo/A" )
B = array(seq(0.1,3.0, by=0.1), dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B,"./data/example.h5", "foo/foobaa/B" )
h5ls("./data/example.h5")


readA = h5read("./data/example.h5", "foo/A")
readB = h5read("./data/example.h5", "foo/foobaa/B")

readA

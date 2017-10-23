## ---- Import_data.R

# Download data from URL
GDPurl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(GDPurl, "Data\\GDP.csv", quiet=TRUE)

EduURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(EduURL, "Data\\EDSTATS_Country.csv", quiet=TRUE)

#read CSV input into data frames
EDSTATS_Country <- read.csv("Data\\EDSTATS_Country.csv",header=TRUE, sep=",", stringsAsFactors=FALSE)
GDP <- read.csv("Data\\GDP.csv",header=TRUE, sep=",", stringsAsFactors=FALSE)

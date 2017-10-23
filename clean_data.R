## ---- clean_data.R

#Data Cleanup#
#set row names

#Remove blank row
GDP <- GDP[,-3]

names(GDP) <- c('CountryCode','Ranking','Long Name','GDPInMillions2010_OR_2011_OR_2012','note')

#IN GDP.CSV: Deleted blank lines for country code and ranking since they did not contain meaningful data for this analysis and might throw off mean analysis.
GDP <- GDP[GDP$Ranking!="", ]
GDP <- GDP[GDP$CountryCode!="", ]

#convert Ranking to numeric
GDP$Ranking <- as.numeric(GDP$Ranking)

#convert GPD to numeric and remove commas
GDP$GDPInMillions2010_OR_2011_OR_2012 <- as.numeric(gsub(",","",GDP$GDPInMillions2010_OR_2011_OR_2012)) 
# caseStudy1Desktop

# Files:
# 
# caseStudy1Desktop.Rproj
# 
# Data\
# 	EDSTATS_Country.csv
# 		-Educational data for countries
# 		-Fields Applicable to this analysis:
# 			-country code: Short code of the country, primary key and foreign key to GDP.csv
# 			-Income Group: Primary Income Group of the country, broken down to these discrete values: 
# 				-Low income
# 				-Lower middle income
# 				-Upper middle income
# 				-High income: OECD
# 				-High income: nonOECD
# 
# 	GDP.csv	
# 		-GDP Information by country. 
# 		-Fields Applicable to this analysis:
# 			-country code: Short code of the country, primary key and foreign key to EDSTATS_Country.csv
# 			-Ranking:  from 1-n of the country's GDP. 
# 			-Long Name: Long name of the country
# 			-GDP Ranking: GDP value for the country in a year. The data is supposed to be mostly for 2012, but the CSV file references that some of the data might come from 2010 or 2011. It is unclear which rows come from which year, which is noted in the analysis
# 		-Raw data, processed in the Data Cleanup phase to remove blank or irrelevant rows
# 
# Paper\
# 	caseStudy1Desktop.Rmd
# 		-RMarkdown file with sections for Importing, Cleaning, and Analyzing the data
# 	caseStudy1Desktop.html
# 		-HTML output of the RMarkdown File for easy in-browser reading
# 	caseStudy1Desktop.pdf
# 		-PDF output of the RMarkdown File for easy in-browser reading
# 	GDP_Per_Country.pdf
# 		-Enlarged form of the plot of GDP data and Income classifications so the country names are slightly more readable.
		
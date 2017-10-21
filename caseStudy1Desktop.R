
#read CSV input into data frames
EDSTATS_Country <- read.csv("Data\\EDSTATS_Country.csv",header=TRUE, sep=",")
GDP <- read.csv("Data\\GDP.csv",header=TRUE, sep=",")


#Data Cleanup#
#IN GDP.CSV: updated/added these column names to match EDSTATS_Country Country
#    CountryCode	
#    Long Name	

#IN GDP.CSV: moved this column in GDP to the header
#    Ranking	

#IN GDP.CSV: Renamed this column to make the header more clear
#    GDPInMillions2010_OR_2011_OR_2012

#IN GDP.CSV: Added a column called "Note" which stores this information:
#     Note: Rankings include only those economies with confirmed GDP estimates. Figures in italics are for 2011 or 2010.
#     a. Includes Former Spanish Sahara.  b. Excludes South Sudan  c. Covers mainland Tanzania only. d. Data are for the area 
#     controlled by the government of the Republic of Cyprus.   e. Excludes Abkhazia and South Ossetia.  f. Excludes Transnistria.

#IN GDP.CSV: Since there is no way to tell what values are for 2010,2011, or 2012 since italics are not tracked in CSV files I renamed the GDP Field Appropriately
#IN GDP.CSV: Deleted blank lines, notes, or lines with ".." for "Not Available" since they did not contain meaningful data.

#Remove everything with an NA ranking (not a country)
GDP <- GDP[-which(is.na(GDP$Ranking)), ]

# 1	Merge the data based on the country shortcode. How many of the IDs match? 
merged_data <- merge(EDSTATS_Country,GDP,by="CountryCode")
print(dim(merged_data))
#[1] 203  35
#Therefore 203 observations match

# 2	Sort the data frame in ascending order by GDP (so United States is last). What is the 13th country in the resulting data frame?

#convert GPD to numeric and remove commas
merged_data$GDPInMillions2010_OR_2011_OR_2012 <- as.numeric(gsub(",","",merged_data$GDPInMillions2010_OR_2011_OR_2012)) 

#order the merged data by GDP 
order.GDP <- order(merged_data$GDPInMillions2010_OR_2011_OR_2012)

#Build a new data frame with the ordered indexes
merged_data_sorted_GDP_asc <- merged_data[order.GDP, ]

#Print the long name of the 13th country in the ordered list 
print(merged_data_sorted_GDP_asc[13,"Long.Name.x"])
#[1] St. Kitts and Nevis

# 3	What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups? 

#Form the required data frames based on Income Group
HighIncomeOECD <- merged_data[merged_data$Income.Group == 'High income: OECD',] 
HighIncomeNonOECD <- merged_data[merged_data$Income.Group == 'High income: nonOECD',] 


#Print means
print(paste("High Income OECD mean Ranking: ",mean(HighIncomeOECD$Ranking)))
#[1] "High Income OECD mean Ranking:  32.9666666666667"

print(paste("High Income Non OECD mean Ranking: ",mean(HighIncomeNonOECD$Ranking)))
#[1] "High Income Non OECD mean Ranking:  91.9130434782609"

# 4	Plot the GDP for all of the countries. Use ggplot2 to color your plot by Income Group.

library(ggplot2)
#Form the basic plot options
GdpPlot <- ggplot(country_merged_data, aes(x=CountryCode, y=GDPInMillions2010_OR_2011_OR_2012, colour=Income.Group))

#Print the plot with logarithmic scaling for higher readability
print(GdpPlot + geom_point() + scale_y_continuous(trans='log2') + theme(axis.text.x = element_text(angle = 90, hjust = 1)))


print(ggplot(country_merged_data, aes(y = GDPInMillions2010_OR_2011_OR_2012, x=Income.Group,fill=Income.Group)) + scale_y_log10()+ geom_point(pch = 21, size = 8, stat = "identity", position=position_jitter())+ scale_fill_manual(values = c("red", "orange", "green", "blue","brown"), na.value = "grey50" ) + theme(axis.text.x = element_text(angle = 45, hjust = 1)))




# 5	Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

#Determine the quantiles
country_merged_data_quantiles <- quantile(country_merged_data$Ranking, probs = seq(0, 1, 0.2))

#Assign the ranks into quantile groups 
country_merged_data$Ranking_quantiles <- cut(country_merged_data$Ranking, breaks = country_merged_data_quantiles)

#print the table of income group vs ranking quantiles
print(table(country_merged_data$Income.Group,country_merged_data$Ranking_quantiles))
#                      (1,38.6] (38.6,76.2] (76.2,114] (114,152] (152,190]
# High income: nonOECD        4           5          8         4         2
# High income: OECD          17          10          1         1         0
# Low income                  0           1          9        16        11
# Lower middle income         5          13         11         9        16
# Upper middle income        11           9          8         8         9

#The intersection of the top ranking group "(1,38.6]" and the "Lower middle income" group is 5
#Therefore there are 5 countries with Lower middle income but among the 38 nations with highest GDP

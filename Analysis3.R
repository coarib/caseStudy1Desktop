## ---- Analysis3.R

#Form the required data frames based on Income Group
HighIncomeOECD <- merged_data[merged_data$Income.Group == 'High income: OECD',] 
HighIncomeNonOECD <- merged_data[merged_data$Income.Group == 'High income: nonOECD',] 

#Print means
print(paste("High Income OECD mean Ranking: ",mean(HighIncomeOECD$Ranking)))
print(paste("High Income Non OECD mean Ranking: ",mean(HighIncomeNonOECD$Ranking)))
## ---- Analysis5.R

#Determine the quantiles
merged_data_quantiles <- quantile(merged_data$Ranking, probs = seq(0, 1, 0.2))

#Assign the ranks into quantile groups 
merged_data$Ranking_quantiles <- cut(merged_data$Ranking, breaks = merged_data_quantiles)

#print the table of income group vs ranking quantiles
print(table(merged_data$Income.Group,merged_data$Ranking_quantiles))

tblData <- merged_data[merged_data$Income.Group == "Lower middle income" & merged_data$Ranking <= 38,]

print(tblData["Short.Name"])
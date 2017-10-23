## ---- Analysis1.R

#Merge EDSTATS_Country and GDP by Country Code
merged_data <- merge(EDSTATS_Country,GDP,by="CountryCode")
print(dim(merged_data))
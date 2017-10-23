## ---- Analysis2.R

#order the merged data by GDP 
order.GDP <- order(merged_data$GDPInMillions2010_OR_2011_OR_2012)

#Build a new data frame with the ordered indexes
merged_data_sorted_GDP_asc <- merged_data[order.GDP, ]

#Print the long name of the 13th country in the ordered list 
print(merged_data_sorted_GDP_asc[13,"Long.Name"])
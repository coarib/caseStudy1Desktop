## ---- Analysis4.R

#Include plotting library
library(ggplot2)

#Form the basic plot options
GdpPlot <- ggplot(merged_data, aes(x=CountryCode, y=GDPInMillions2010_OR_2011_OR_2012, colour=Income.Group))

#Print the plot with logarithmic scaling for higher readability, each Income Group in a different color
print(GdpPlot + geom_point() +  scale_y_log10() + theme(axis.text.x = element_text(angle = 90, hjust = 1)))

#print a plot grouped by Income.Group since it looks a little cleaner and might provide insights that are easier to interpret
print(ggplot(merged_data, aes(y = GDPInMillions2010_OR_2011_OR_2012, x=Income.Group,fill=Income.Group)) + scale_y_log10()+ geom_point(pch = 21, size = 8, stat = "identity", position=position_jitter())+ scale_fill_manual(values = c("red", "orange", "green", "blue","brown"), na.value = "grey50" ) + theme(axis.text.x = element_text(angle = 45, hjust = 1)))

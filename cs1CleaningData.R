
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

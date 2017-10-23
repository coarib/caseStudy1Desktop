#Rule to run all necessary steps to produce Markdown file of analysis output
all: Case.html

#Cleans project of files produced throughout process of cleaning and analyzing data
clean: 	
	rm -f Data\GDP.csv Data\EEDSTATS_Country Paper\caseStudy1.html Paper\caseStudy1.md

#Installs packages needed to complete data cleaning and analyzing of data
load_libraries: Load_libraries.R
	Rscript $<

#Downloads GDP.csv and Edu.csv from URLs to prepare for data cleansing
import_data: Import_data.R
	Rscript $<

#Runs R code to clean data	
clean_data: clean_data.R load_libraries import_data 
	Rscript $<
	
#Runs R code to analyze data and answers to Case Study 1	
Analysis: Analysis1.R clean_data load_libraries import_data 
	Rscript $<


#Runs R code to analyze data and answers to Case Study 1	
Analysis: Analysis2.R Analysis1.R clean_data load_libraries import_data 
	Rscript $<


#Runs R code to analyze data and answers to Case Study 1	
Analysis: Analysis3.R Analysis2.R Analysis1.R clean_data load_libraries import_data 
	Rscript $<


#Runs R code to analyze data and answers to Case Study 1	
Analysis: Analysis4.R Analysis3.R Analysis2.R Analysis1.R clean_data load_libraries import_data 
	Rscript $<


#Runs R code to analyze data and answers to Case Study 1	
Analysis: Analysis5.R Analysis4.R Analysis3.R Analysis2.R Analysis1.R clean_data load_libraries import_data 
	Rscript $<

#Rule to produce RMarkdown file for reporting	
Paper\caseStudy1.html: caseStudy1Desktop.Rmd Analysis5 
	Rscript -e 'rmarkdown::render("$<")'	
## ---- Load_libraries.R

if (!is.element("dplyr", installed.packages()[,1]))
  install.packages("dplyr",repos="http://cran.rstudio.com")
if (!is.element("ggplot2", installed.packages()[,1]))
  install.packages("ggplot2",repos="http://cran.rstudio.com")
if (!is.element("stringr", installed.packages()[,1]))
  install.packages("stringr",repos="http://cran.rstudio.com")
if (!is.element("data.table", installed.packages()[,1]))
  install.packages("data.table",repos="http://cran.rstudio.com")
if (!is.element("readr", installed.packages()[,1]))
  install.packages("readr",repos="http://cran.rstudio.com")

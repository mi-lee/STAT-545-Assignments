library(RCurl)
cat(file = "gapminder.tsv", getURL("https://raw.githubusercontent.com/STAT545-UBC/STAT545-UBC.github.io/master/gapminderDataFiveYear.txt"))
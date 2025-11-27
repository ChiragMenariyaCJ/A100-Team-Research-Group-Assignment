library(readr)
library(readxl)
cr <- read_csv("Crashes By Place of Residence.csv", col_names = TRUE)
print(colnames(cr))


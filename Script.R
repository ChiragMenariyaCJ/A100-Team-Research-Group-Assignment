# To read the data
library(readr)
library(readxl)

# Import the dataset in "cr"
cr <- read_csv("Crashes By Place of Residence.csv", col_names = TRUE)

# Print Column Names
print(colnames(cr))

# To open the imported dataset and display it in a new tab.
View(cr)

# Install & Loading libraries to change format from wide to long
install.packages("tidyr")
install.packages("dplyr")
library(tidyr)
library(dplyr)

# Convert to long format
cr_long <- cr %>%
  pivot_longer(
    cols = -Date,
    names_to = "City",
    values_to = "Crashes"
  ) %>%
  rename(Year = Date)

# Define regions
north_parishes <- c("St. James", "Trelawny", "St. Ann", "St. Mary", "Portland", "Hanover", "Westmoreland")
south_parishes <- c("Kingston", "St. Andrew", "St. Catherine", "Clarendon", "Manchester", "St. Elizabeth", "St. Thomas")

# Add Region column
cr_long <- cr_long %>%
  mutate(
    Region = case_when(
      City %in% north_parishes ~ "North",
      City %in% south_parishes ~ "South",
      City == "Not known" ~ "Unknown",
      City == "Overseas" ~ "External",
      TRUE ~ "Other"
    )
  )

# View the result
View(cr_long)

# 
print(colnames(cr_long))

colnames(cr_long)[4] <- "Region_in_Jamaica"
colnames(cr_long)[3] <- "Number_of_Crashes"


#Analysis of Dataset
colnames(cr_long)
summary(cr_long$Number_of_Crashes) 
print(which.min(cr_long$Number_of_Crashes))
print(which.max(cr_long$Number_of_Crashes))
print (cr_long$Number_of_Crashes[64])
print (cr_long$Number_of_Crashes[1])
print (cr_long$Region_in_Jamaica[64])
print (cr_long$Region_in_Jamaica[1])
print (cr_long$City[64])
print (cr_long$City[1])


# Taking only North and South regions
cr_test <- cr_long %>%
  filter(Region_in_Jamaica %in% c("North", "South")) %>%
  mutate(
    Region_in_Jamaica = factor(Region_in_Jamaica, levels = c("South", "North"))
  )

# File Name for Exporting Bar Plot
png("Visualisation.png")

# Create bar plot with y-axis
hist(
  cr_long$Number_of_Crashes,
  main = "Histogram of Number of Crashes",
  xlab = "Number of Crashes",
  ylab = "Frequency",
  col = "lightblue",
  breaks = 10
)

# this closes the file after writing
dev.off()

# Wilcoxon test (non-normal data)
wilcox.test(Number_of_Crashes ~ Region_in_Jamaica, data = cr_test)
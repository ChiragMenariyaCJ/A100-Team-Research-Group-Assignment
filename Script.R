# To read the data
library(readr)
library(readxl)

# Import the dataset in "cr"
cr <- read_csv("Crashes By Place of Residence.csv", col_names = TRUE)

# Print Column Names
print(colnames(cr))

# To open the imported dataset and display it in a new tab.
View(cr)

# Loading libraries to change format from wide to long
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
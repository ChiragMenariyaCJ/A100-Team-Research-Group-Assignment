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

# Print Column Names of long format
print(colnames(cr_long))

# Renaming Columns
colnames(cr_long)[4] <- "Region_in_Jamaica"
colnames(cr_long)[3] <- "Number_of_Crashes"

# Export the long format data to a new CSV file
write.csv(cr_long, file = "output.csv", row.names = FALSE)

# Analysis of Dataset
colnames(cr_long)
summary(cr_long$Number_of_Crashes)
print(which.min(cr_long$Number_of_Crashes))
print(which.max(cr_long$Number_of_Crashes))
print(cr_long$Number_of_Crashes[64])
print(cr_long$Number_of_Crashes[1])
print(cr_long$Region_in_Jamaica[64])
print(cr_long$Region_in_Jamaica[1])
print(cr_long$City[64])
print(cr_long$City[1])


# Taking only North and South regions
cr_test <- cr_long %>%
  filter(Region_in_Jamaica %in% c("North", "South")) %>%
  mutate(
    Region_in_Jamaica = factor(Region_in_Jamaica, levels = c("South", "North"))
  )

# File Name for Exporting Hist Plot
png("histogram_non_normal_data.png")

# Create Histogram
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

# Wilcoxon test (for not normally distributed data)
wilcox.test(Number_of_Crashes ~ Region_in_Jamaica, data = cr_test)

# File Name for Exporting Bar Plot
png("Visualisation.png")

# Total Number of Crashes by Region in Jamaica
region_sum <- aggregate(Number_of_Crashes ~ Region_in_Jamaica, data = cr_long, sum, na.rm = TRUE)

# Create colors equal to number of regions
cols <- rainbow(nrow(region_sum))

# Create bar plot with y-axis
bp <- barplot(
  region_sum$Number_of_Crashes,
  names.arg = rep("", nrow(region_sum)),
  col = rainbow(nrow(region_sum)),
  main = "Distribution of Number of Crashes by Region in Jamaica",
  xlab = "Region",
  ylab = "Number of Crashes",
  ylim = c(0, max(region_sum$Number_of_Crashes) * 1.15)
)

# Add values on bars
text(
  x = bp,
  y = region_sum$Number_of_Crashes,
  labels = format(region_sum$Number_of_Crashes, big.mark = ","),
  pos = 3,
  cex = 0.8
)

# Legend
legend(
  "topright",
  legend = region_sum$Region_in_Jamaica,
  fill = rainbow(nrow(region_sum)),
  bty = "o",
  bg = "white",
  box.col = "black"
)

# this closes the file after writing
dev.off()

# Creating Contingency Table
contingency_table <- cr_long %>%
  group_by(Year, Region_in_Jamaica) %>%
  summarise(Total_Crashes = sum(Number_of_Crashes), .groups = "drop")

# Show "contingency_table" Table
print(contingency_table)

# Long to Wide format for better understanding
contingency_table_wide <- contingency_table %>%
  pivot_wider(
    names_from = Region_in_Jamaica,
    values_from = Total_Crashes,
    values_fill = 0
  )

# Converting Year column to character type so it can be added as TOTAL row
contingency_table_wide$Year <- as.character(contingency_table_wide$Year)

# Show "contingency_table_wide" Table
print(contingency_table_wide)

# Creating total row
total_row <- contingency_table_wide %>%
  summarise(
    Year = "TOTAL",
    South = sum(South, na.rm = TRUE),
    North = sum(North, na.rm = TRUE),
    Unknown = sum(Unknown, na.rm = TRUE),
    External = sum(External, na.rm = TRUE)
  )

# Show "total_row" row
print(total_row)

# Adding total row in Contingency Table
contingency_table_final <- bind_rows(contingency_table_wide, total_row)

# Show "contingency_table_final" Table
print(contingency_table_final)

# Saving the table as .CSV file
write.csv(contingency_table_final, "Contingency Table.csv", row.names = FALSE)
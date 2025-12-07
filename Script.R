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
  filter(Region %in% c("North", "South")) %>%
  mutate(
    Region = factor(Region, levels = c("South", "North"))
  )

# Number of observations per region
table(cr_test$Region)

# Mean crashes by region
aggregate(Crashes ~ Region, data = cr_test, mean, na.rm = TRUE)

# Independent t-test
t.test(Crashes ~ Region, data = cr_test)

# Wilcoxon test (non-normal data)
wilcox.test(Crashes ~ Region, data = cr_test)

# File Name for Exporting Bar Plot
png("Visualisation.png")

# Total crashes by region
region_sum <- aggregate(Crashes ~ Region, data = cr_long, sum, na.rm = TRUE)

# Create colors equal to number of regions
cols <- rainbow(nrow(region_sum))

# Create bar plot with y-axis
bp <- barplot(
  region_sum$Crashes,
  names.arg = rep("", nrow(region_sum)),
  col = rainbow(nrow(region_sum)),
  main = "Distribution of Crashes by Region",
  xlab = "Region",
  ylab = "Number of Crashes",
  ylim = c(0, max(region_sum$Crashes) * 1.15)
)

# Add values on bars
text(
  x = bp,
  y = region_sum$Crashes,
  labels = format(region_sum$Crashes, big.mark = ","),
  pos = 3,
  cex = 0.8
)

# Legend
legend(
  "topright",
  legend = region_sum$Region,
  fill = rainbow(nrow(region_sum)),
  bty = "o",
  bg = "white",
  box.col = "black"
)

# this closes the file after writing
dev.off()
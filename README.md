# 1. Introduction

## 1.1.	Problem statement and research motivation (100 words)

Road traffic crashes are a leading public health and development challenge in Jamaica, with hundreds of fatalities reported annually. This study asks whether towns and cities in Jamaica’s northern and southern regions differ in mean crash counts, aiming to reveal geographic disparities that current national summaries do not fully break down. Identifying regional differences can pinpoint high-risk areas and inform targeted infrastructure, enforcement, and education policies. Using island-wide crash records segmented by parish and town will allow robust statistical comparison and guide resource allocation to reduce injuries and fatalities across Jamaica’s varied transport routes. The analysis will support evidence-based policy decisions (Pan American Health Organization, 2024).

## 1.2.	The data set (75 words)

The dataset contains yearly records of road traffic crashes across towns and cities in Jamaica, including variables such as Year, City, Number_of_Crashes, and Region_in_Jamaica (North, South, Unknown, External). It provides a detailed view of crash distribution between 2007 and 2015, allowing comparison of crash frequencies across regions. This structure enables statistical analysis, such as comparing mean crashes between northern and southern areas, to identify area-based patterns, assess regional risk, and guide targeted road-safety measures.

## 1.3.	Research question (50 words). 
Is there a difference in the mean of the crashes between towns /cities of the northern part & southern part of Jamaica?

## 1.4.	Null hypothesis and alternative hypothesis (H₀/H₁) 
For this study, the null hypothesis (H₀) states that there is no difference in the mean number of road traffic crashes between towns and cities in the northern and southern regions of Jamaica. In formal terms: 
```
H₀: µNorth = µSouth
```
The alternative hypothesis (H₁) proposes that there is a difference in the mean crash counts between the two regions, indicating possible regional variability: 
```
H₁: µNorth ≠ µSouth
```
These hypotheses directly address the research question by testing whether regional crash patterns differ significantly.

---

# 2.	Background research

## 2.1	Research papers

Road traffic crashes remain a major public challenge in Jamaica and several studies highlights importance of geographic and demographic patterns. (Crawford and McGrowder, 2008) did research on national crash records and found a very strong point of incidents in southern parishes, particularly St. Andrew and St. Catherine. Their study highlighted demographic difference, with males having the majority of fatalities and identified that weekend periods having interval as high-risk. This early work shows that crash numbers are unevenly distributed across regions.

In another study, (Bourne et al, 2022) examined crash fatalities before and during the COVID-19 pandemic and found an increase from 389 deaths in 2018 to 488 in 2022, where males accounting for the higher number of fatalities. These findings tells that road deaths remain consistently high in Jamaica and that both geographic and demographic patterns influence the risk.
Together, these studies show the importance of investigating whether meaningful differences exist in crash levels between Jamaica’s northern and southern regions.

## 2.2	Why RQ is of interest

This research question matters because road traffic crashes place a heavy public health and economic burden on Jamaica, with more than 300–400 deaths recorded each year. While earlier studies show that certain areas particularly those in the south have experienced higher crash rates. There has been little statistical comparison of broader northern versus southern regional patterns. Understanding whether mean crash levels differ between these regions can help reveal factors such as road conditions, traffic volume, enforcement practices, or socioeconomic differences that may influence the risk. Identifying such difference would support targeted and region-specific safety rules rather than one that fits for all national policy. 

---

# 3.	Visualisation

## 3.1	Appropriate graphs for the RQ
The bar plot clearly compares distribution of crashes based on region i.e. North and South making it more observable. This visualization depicts regional crash patterns identifying meaningful disparities existing between two areas.

![alt text](images/Visualisation.png)

Fig. 1. Distribution of Number of Crashes by Regions in Jamaica

![alt text](images/Boxplot_Crashes_by_Region.png)

Fig. 2. Boxplot for Comparison of mean

| Year | External | North | South | Unknown |
|------|----------|--------|--------|----------|
| 2007 | 79       | 3477   | 11320 | 1868     |
| 2008 | 53       | 3101   | 10393 | 3615     |
| 2009 | 58       | 3224   | 9283  | 2695     |
| 2010 | 22       | 1503   | 2850  | 1090     |
| 2011 | 54       | 1697   | 4724  | 1249     |
| 2012 | 97       | 2830   | 8105  | 2147     |
| 2013 | 101      | 2850   | 8477  | 2379     |
| 2014 | 99       | 2685   | 7263  | 2880     |
| 2015 | 86       | 1795   | 4475  | 1126     |
| **TOTAL** | **649** | **23162** | **66890** | **19049** |

Table. 1. Contingency Table : [text](<Exported CSV Files/Contingency Table.csv>)

## 3.2	Additional information relating to understanding the data (optional)

South region contains Kingston which is country’s largest urban centre having heavier traffic volumes and therefore has the highest crashes in dataset while North regions has mostly rural areas having less traffic volumes and hence contributing less crashes in Jamica.

## 3.3	Useful information for the data understanding 

The plot represents how crashes are distributed among regions, also revealing the fact that South has highest count of crashes while north records substantially lower aiding understanding of regional imbalances in Jamica. Overall, the purpose of plot was to compare crash frequency among regions of Jamica.

---

# REFERENCES

1. Pan American Health Organization (2024) National Road Safety Council Review Meeting Highlights Urgency for Comprehensive Action to Stem Road Fatalities in Jamaica. Available at: https://www.paho.org/en/news/11-1-2024-national-road-safety-council-review-meeting-highlights-urgency-comprehensive-action (Accessed: 7 December 2025).
2. Bourne, P.A., Scarlett, M. and Beckford, K. (2022) Road accident fatalities in Jamaica before and during the Coronavirus disease 19 (COVID-19) pandemic. Available at: https://www.researchgate.net/publication/354857574 (Accessed: 7 December 2025).
3. Bourne, P.A., Gayle, D. and Anderson, T. (2024) An investigation into the financial costs associated with motor vehicle accidents among public transport operators in Jamaica. Available at: https://www.researchgate.net/publication/381843459 (Accessed: 7 December 2025).
4. Crawford, T. and McGrowder, D. (2008) ‘Road traffic injury epidemic in Jamaica: implications for governance and public policy’, Asian Social Science, 4(10), pp. 178–192. Available at: https://pdfs.semanticscholar.org/ac9d/ef73134c140c2417ee46e4694ae631b3caf7.pdf (Accessed: 7 December 2025).

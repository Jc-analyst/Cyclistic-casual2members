![R](https://img.shields.io/badge/Language-R-blueviolet?style=flat-square)
![Data Formats](https://img.shields.io/badge/Data-CSV%20%7C%20RMD%20%7C%20R-green?style=flat-square)
![Visuals](https://img.shields.io/badge/Visuals-PNG%20Graphs%20%26%20EDA-lightblue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/Jc-analyst/Cyclistic-Capstone?style=flat-square)


# R Project (Merging, cleaning, Analysing, Visualization) 

# 🚲 Cyclistic Bike-Share Capstone Project

## 📘 About the Project

This analysis was conducted as part of the **Google Data Analytics Capstone Project**. It explores rider behavior using one year of trip data from Cyclistic — a fictional bike-share company in Chicago — with the goal of recommending strategies to increase **annual memberships**.

---

## 🗂️ Repository Structure

```
├── data/                  # 16 CSV files (one per month)
├── visuals/               # 6 PNGs: graphs & EDA visuals
├── cyclistic_analysis.R   # R script with all code
├── cyclistic_report.Rmd   # Full RMarkdown notebook
└── README.md              # You're here
```

---

## 🧪 Tools & Packages

- **Language:** R
- **Editor:** RStudio
- **Libraries:** `tidyverse`, `dplyr`, `ggplot2`, `lubridate`, `janitor`, `scales`, `readr`, `rmarkdown`

---

## 🔍 Analysis Workflow

1. **Data Wrangling**  
   - Merged 12 months of trip data into a single dataframe  
   - Removed nulls, duplicates, invalid ride lengths  
   - Converted timestamps and engineered new time-related features

2. **Exploratory Data Analysis (EDA)**  
   - Compared casual vs member usage across day of week, ride duration, station start/end  
   - Visualized trends over time and across demographics

3. **Key Visuals (from `/visuals`)**
   - Plot01 – Percentage of Bike Types    
   - Plot02 – Total Rides by Bike Type 
   - Plot03 – Pie Chart of Ride Type Distribution 
   - Plot04 – Total Rides in 2023
   - Plot05 – Monthly Ride Trends in 2023 
   - Plot06 – Total Rides (2023–2024) 

4. **Insights & Recommendations**  
   - Members ride more frequently but for shorter durations  
   - Casuals prefer weekends and afternoons  
   - Suggest using trial memberships, targeted weekend discounts, and app-based ride nudges

---

## 📊 R Markdown Notebook

You can explore the full narrative and code in the R Markdown file:

- **`cyclistic_report.Rmd`** — combines code, outputs, and insights  
- Knit it in RStudio or from the terminal:

```r
install.packages("rmarkdown")
rmarkdown::render("cyclistic_report.Rmd")
```

Or click the **Knit** button in RStudio to generate an HTML or PDF report.

---
## 📊 Visualizations

### Plot01 – Percentage of Bike Types  
Bar chart showing the percentage breakdown of bike types used (e.g., classic, docked, electric). This highlights rider preferences by bike category.  
📁 `visuals/bike_type_percentage.png`

### Plot02 – Total Rides by Bike Type  
Displays the total number of rides taken with each bike type. Helps identify demand and usage levels across categories.  
📁 `visuals/total_rides_by_type.png`

### Plot03 – Pie Chart of Ride Type Distribution  
A pie chart visualizing the ratio between **member** and **casual** riders across all trips. Shows how the user base is split.  
📁 `visuals/ride_type_distribution_pie.png`

### Plot04 – Total Rides in 2023  
Bar or line chart of all rides logged during the 2023 calendar year. Useful for identifying peak ridership months or seasons.  
📁 `visuals/total_rides_2023.png`

### Plot05 – Monthly Ride Trends in 2023  
Line graph showing how ride counts fluctuated each month in 2023. Clear insight into seasonal and behavioral changes.  
📁 `visuals/monthly_ride_trends_2023.png`

### Plot06 – Total Rides (2023–2024)  
Combined visualization showing total ride volumes across two full years (2023 and 2024), helping assess overall growth or decline.  
📁 `visuals/total_rides_2023_2024.png`

---

## 📁 Data Source

- 16 months (Jan 2023 to April 2024) of trip data provided by Motivate International Inc.  
- Available via: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

> *Data is licensed under the [Chicago Data License](https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html)*

---

## 🙌 Acknowledgments

Special thanks to the Google Data Analytics Certificate team and the [R for Data Science](https://r4ds.had.co.nz/) community for resources, guidance, and motivation throughout this capstone journey.

---

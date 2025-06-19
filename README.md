# Cyclistic-casual2members

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
   - `weekday_usage.png`: Rides by day of week per rider type  
   - `ride_duration.png`: Avg ride time by user type  
   - `monthly_trends.png`: Monthly trip totals  
   - `hourly_patterns.png`, `station_heatmap.png`, `bike_type_breakdown.png`

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

## 📁 Data Source

- 12 months of trip data provided by Motivate International Inc.  
- Available via: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

> *Data is licensed under the [Chicago Data License](https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html)*

---

## 🙌 Acknowledgments

Special thanks to the Google Data Analytics Certificate team and the [R for Data Science](https://r4ds.had.co.nz/) community for resources, guidance, and motivation throughout this capstone journey.

---

#install packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("ggplot2")

#upload tools
library(tidyverse)
library(skimr)
library(janitor)
library(lubridate)
library(ggplot2)

#working file 
getwd()

#1. IMPORT DATA

#import your csv file, 12 meses 2023, 4 meses 2024
cy1 <- read_csv("3-1.csv")
cy2 <- read_csv("3-2.csv")
cy3 <- read_csv("3-3.csv")
cy4 <- read_csv("3-4.csv")
cy5 <- read_csv("3-5.csv")
cy6 <- read_csv("3-6.csv")
cy7 <- read_csv("3-7.csv")
cy8 <- read_csv("3-8.csv")
cy9 <- read_csv("3-9.csv")
cy10 <- read_csv("3-10.csv")
cy11 <- read_csv("3-11.csv")
cy12 <- read_csv("3-12.csv")
cy13 <- read_csv("4-1.csv")
cy14 <- read_csv("4-2.csv")
cy15 <- read_csv("4-3.csv")
cy16 <- read_csv("4-4.csv")

#2 CONCATENATE DATA FRAMES

#all data in 1 data frame 
cyclistic_ride <-rbind(cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8,cy9,cy10,cy11,cy12,cy13,cy14,cy15,cy16)

#3 UNDERSTAND DATA TYPES

#getting to know the data
head(cyclistic_ride)
str(cyclistic_ride)
glimpse(cyclistic_ride)
colnames(cyclistic_ride)
skim_without_charts(cyclistic_ride)

#cleaning the data
cyclistic_ride <- janitor ::remove_empty(cyclistic_ride,which = c("cols"))
cyclistic_ride <- janitor ::remove_empty(cyclistic_ride,which = c("rows"))

#4 VERIFIYING AND DURATION DIFFERENCE

cyclistic_ride$started_at[1]
cyclistic_ride$ended_at[1]

#duration trips
cyclistic_ride$duration <- cyclistic_ride$ended_at - cyclistic_ride$started_at
#creating min and hours
cyclistic_ride$ride_min <- cyclistic_ride$duration/60
cyclistic_ride$ride_hrs <- cyclistic_ride$ride_min/60

#5 MAKING SURE there is not negative numbers
#CHECKING POSSIBLE MISTAKES = 1688
sum(cyclistic_ride$started_at>=cyclistic_ride$ended_at)

#Checking the total number 6,804,626
str(cyclistic_ride)

#positive numners, creating a new one with positives numbers
ride_time <- cyclistic_ride %>%
  filter(ride_hrs>0)

#Checking the total number again 6,802,938
str(ride_time)

#Duration just with the right and positive numbers in min

ride_time$duration_clean <- (ride_time$ended_at- ride_time$started_at)/60
str(ride_time)

#6 CHEKING TO AVOID NUL VALUES
#Checking columns with null values
colSums(is.na(ride_time))
  ## the values to use are completed 

#7 UNIQUE VALUES IN TYPE OF BIKE "rideable_type" AND MEMBERSHIP "member_casual"
unique(ride_time$rideable_type)
  ##[1] "electric_bike" "classic_bike"  "docked_bike" 

unique(ride_time$member_casual)
  ##[1] "member" "casual"

#8 LOOK FOR DUPLICATES
sum(duplicated(ride_time$ride_id))
 ##[1] 0

#9 ORGANIZING AND ADDING DAY AND MONTHS
ride_time$day <- wday(ride_time$started_at, week_start = , label = TRUE)
ride_time$month <- month(ride_time$started_at, label=TRUE)
ride_time$year <- year(ride_time$started_at)
str(ride_time)

#Double checking uniqueness of dates
unique(ride_time$day)
unique(ride_time$month)
unique(ride_time$year)

#II Analyse

#1 number of membership last 16 months
library(tidyverse)
ride_time %>%
    group_by(member_casual) %>%
    summarise(count=n()) %>%
    rename("total"="count")
  ##Tibble 2x2
    ## Casual 2344469
    ## Member 4458469

#number of membership per las 16 months
ride_time %>%
  group_by(member_casual, year) %>%
  summarise(count=n()) %>%
  rename("total"="count")
    ## 2023 Casual 2058621 , member 3659987
    ## 2024 Casual 285848 , member 798482

#Compare the numbers of rides visually
library(ggplot2)
ggplot(data = ride_time) + 
    geom_bar(mapping = aes(x=member_casual,fill=member_casual) ,show.legend = TRUE, width = 0.5) + 
    labs(x= "Type of Cyclist", y="Number of rides", title= "Total number of Cycle rides, last 16 months")

#2 Total rides per month per customer type per year
monthly_count_2023 <-ride_time %>%
                filter(year==2023) %>%
                group_by(month,member_casual) %>%
                summarise(count=n())

monthly_count_2024 <-ride_time %>%
  filter(year==2024) %>%
  group_by(month,member_casual) %>%
  summarise(count=n())

monthly_count <-ride_time %>%
  group_by(month,member_casual, year) %>%
  summarise(count=n())


#Plot line charts
##Rides in 2023
ggplot(data = monthly_count_2023) +
    geom_point(mapping = aes(x=monthly_count_2023$month, y=monthly_count_2023$count, color = monthly_count_2023$member_casual)) +
    geom_line(mapping =aes(x=monthly_count_2023$month, y=monthly_count_2023$count, group = monthly_count_2023$member_casual, color = monthly_count_2023$member_casual), linewidth=0.5) +
    labs(x="Month", y="Rides amount", title = "Numbers of rides in 2023")

#3 Total rides taken per day

weekday_ride_count <- ride_time %>%
                    filter(year==2023) %>%
                    group_by(day, member_casual) %>%
                    summarise(count=n()) %>%
                    pivot_wider(names_from = "member_casual", values_from = "count") %>%
                    mutate("total_rides" = casual + member) %>%
                    mutate( "%casual" = (casual/total_rides)*100 ) %>%
                    mutate( "%member" = (member/total_rides)*100 )
    ##in 2023, the most used day is Saturday and the least day used is Monday, but the members are the majority in every day
    ##in 2023,For the casual users, The weekend is the most populat time with 46 and 45% respectively 

#Check the numbers in a different way to create the graphic
weekday_ride_count_sum <- ride_time %>%
                    filter(year==2023) %>%
                    group_by(day, member_casual) %>%
                    summarise(count=n())

ggplot(data=weekday_ride_count_sum) +
    geom_col(mapping = aes(x= day  , y= count, fill = member_casual )) +
    labs( x= "week_day", y = "number_rides", title= "Total_rides_in_2023" )
    ##it can be seen that the number of casual rides are less than members but still representing a significant part for the company

#4 types of bikes per type of customers

type_of_bike <- ride_time %>%
                filter(year==2023) %>%
                group_by(rideable_type) %>%
                summarise(count=n()) %>%
                mutate ("perc_bike_type" = count/sum(count)*100)
    ##it can be seen that the most popular type are Electric and Classic with 51% and 47% respectively while docked bike represent just a 1%.

                

#sum(type_of_bike$count) #5718608

#type_of_bike_percent <- type_of_bike %>%
#mutate( "%bike_type" = count/5718608*100) %>%
#print()

#4.1 pie chart simple 
rideable_type <- c("classic_bike", "docked_bike", "electric_bike" )
perc_bike_type <- c(47.1, 1.4, 51.5)
pie(x = perc_bike_type, labels= rideable_type)

  ## another pie chart
pie(x = type_of_bike_percent$`%bike_type`, labels= type_of_bike_percent$rideable_type)

  ## same pie chart
pie(x = type_of_bike$perc_bike_type,   labels = type_of_bike$rideable_type) 

#4.2 bar graph of preferences
type_of_bike %>%
ggplot(aes(x= rideable_type, y = perc_bike_type )) + geom_bar(stat = "identity" )
  ## it can be seen that the preference is electric and classic 
    
type_of_bike_2 <- ride_time %>%
                  filter(year==2023) %>%
                  group_by(rideable_type, member_casual) %>%
                  summarise(count=n()) %>%
                  pivot_wider(names_from = member_casual, values_from = count) %>%
                  mutate(total_count = sum(casual, member, na.rm = TRUE)) %>%
                  mutate( "per_Casual" = casual/total_count*100) %>%
                  mutate( "per_member" = member/total_count*100)
  ##Its good to notice that the docked bike is just used by casual riders, also that the percentage of casual riders is 1/3 from the total number of rides, being a pottential 

type_of_bike_3 <- ride_time %>%
                  filter(year==2023) %>%
                  group_by(rideable_type, member_casual) %>%
                  summarise(count=n())

ggplot(data=type_of_bike_3) +
  geom_col(mapping = aes(x=rideable_type,y=count, fill=member_casual)) +
  labs(x="Type_ride", y="Total_ride", title= "total number of ride/ type of ride")
  ## In this graph it can be seen again that docket by is just used by casual riders in a very small number, while casual riders that use classic or electric bike represent nearly 1/3 of the total number of rides.

str(type_of_bike_3)
install.packages("rmarkdown")

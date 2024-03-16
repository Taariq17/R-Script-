library(dplyr)
library(zoo)

df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/6_group_by/weather_by_cities.csv")
head(df,5)
View(df)

max(subset(df$temperature,df$city=="new york"))

groupdf<- df %>%
  group_by(city)
groupdf

groupdf <- df %>%
  group_by(city) %>%
  group_split()

for(i in seq_along(groupdf)){
  city <- unique(groupdf[[i]]$city)
  data <- groupdf[[i]]
  print(paste("city",city))
  print("\n")
  print(paste("data:",data))
}
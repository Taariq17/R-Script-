library(dplyr)
library(zoo)

df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/5_handling_missing_data_replace/weather_data.csv")
View(df)
df[df==-99999] <- 0
head(df,5)

df2 <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/5_handling_missing_data_replace/weather_data.csv")
df2 %>% 
  mutate_all(~replace(., . %in% c(-99999, -88888), NA))
df2 %>%
  mutate_at(vars(temperature, windspeed, event), 
            ~ ifelse(. == -99999 | . %in% c(-99999, -88888) | . == "no event", NA, .))


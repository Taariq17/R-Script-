library(dplyr)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/4_handling_missing_data_fillna_dropna_interpolate/weather_data.csv")
head(df,2)
View(df)
class(df$day[1])
df$day <- as.Date(df$day)
class(df$day[1])

#Fill na value
library(zoo)

df$temperature <- na.fill(df$temperature,fill=mean(df$temperature,na.rm = TRUE))
df$windspeed   <- na.fill(df$windspeed,fill = mean(df$windspeed,na.rm = TRUE))
df$event[is.na(df$event)] <- "No event"
View(df)
head(df,4)
df$event <- ifelse(is.na(df$event), "No event", df$event)
head(df,4)
# Check if 'event' column is empty and fill with "No event" if it is
df$event <- ifelse(df$event == "", "No event", df$event)
head(df,4)
View(df)


df2 <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/4_handling_missing_data_fillna_dropna_interpolate/weather_data.csv")
#Forward Null value fill
df2[df2 == ""] <-NA # We are using this method because of the data has empty row we are just converting it to NA values which denotes null value
View(df2)
ffill_df <- na.locf(df2,fromLast = FALSE) #Forward fill null value
head(ffill_df,6)
View(ffill_df)

bfill_df <- na.locf(df2,fromLast = TRUE) # backward fill null value
View(bfill_df)

#Dropping null value

na_r_df <- na.omit(df2)
View(na_r_df)


#Dropping null value with 2 

df_cleaned <- df2[rowSums(!is.na(df2)) >= 2, ]
View(df_cleaned)

#Dropping null value with 3

df_cleaned_2 <- df2[rowSums(!is.na(df2)) >= 3, ]
View(df_cleaned_2)

library(dplyr)
library(zoo)
library(openxlsx)

df <- read.csv("D:/R Programing Scripts Practice/R-Script-/chapter4_assets/chapter4_assets/7_outlier_detection_using_iqr_boxplot/heights.csv")
head(df,5)
View(df)

#Maximum Of Height 
max(df$height)

#Minimum Of Height
min(df$height)

#Mean of Height 
mean(df$height)

#Median of Height
median(df$height)

#To find range of data spread is dispersion max-min

max(df$height)- min(df$height)
Q1 <- quantile(df$height,0.25)
Q3 <- quantile(df$height,0.75) 
#To find Inter Quartile Range Q3 - Q1
IQR <- Q3 - Q1

#To find lower limt of the data is Q1 * 1.5 * IQR
lower <- Q1- 1.5*IQR
# Lower limit is 3.9625
lower

#To find upper limit of the data is Q3 * 1.5 * IQR
Upper <- Q3+ 1.5*IQR
#Upper limit
Upper 

df[df$height <lower | df$height >Upper,]

df_new <-  df[df$height > lower & df$height < Upper,]
head(df_new)
View(df_new)
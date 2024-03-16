#Outlier handling with box plot 
library(dplyr)
library(openxlsx)
library(zoo)
library(ggplot2)

df <- read.xlsx("D:/R Programing Scripts Practice/R-Script-/chapter4_assets/chapter4_assets/7_outlier_detection_using_iqr_boxplot/region_wise_sales.xlsx")

head(df,5)

unique(df$Region)

#So we have three regions in our datasets

df_APAC = df[df$Region=="APAC",]
df_Europe = df[df$Region=="Europe",]
df_Americas = df[df$Region=="Americas",]

summary(df_APAC)
#APAC minimum sales is 18579 and maximum sales is 38143 
# Lets find inter quartile range for APAC

Q1 = quantile(df_APAC$Sales,0.25)
Q1
Q3 = quantile(df_APAC$Sales,0.75)
Q3
#Let's find the Lower limit and Upper limit
IQR_APAC = Q3-Q1
IQR_APAC
lower_APAC = Q1 - 1.5*IQR_APAC
lower_APAC
Upper_APAC = Q3 + 1.5*IQR_APAC
Upper_APAC
#This APAC region is fine it's doesnt have outlier by seeing comaparing minimum value with lower and maximum value with upper

#Europe Region
summary(df_Europe)
#let's find the Q1 , Q2, IQR, Upper and Lower
Q1_E = quantile(df_Europe$Sales,0.25)
Q1_E
Q3_E = quantile(df_Europe$Sales,0.75)
Q3_E
#Let's find the Lower limit and Upper limit
IQR_E = Q3_E-Q1_E
IQR_E
lower_E = Q1_E - 1.5*IQR_E
lower_E
Upper_E = Q3_E + 1.5*IQR_E
Upper_E
#By Comparing min with lower and max with upper its show that Europe data has outlier in Max value.
summary(df_Americas)
#Americas
Q1_A = quantile(df_Americas$Sales,0.25)
Q1_A
Q3_A = quantile(df_Americas$Sales,0.75)
Q3_A
#Let's find the Lower limit and Upper limit
IQR_A = Q3_A-Q1_A
IQR_A
lower_A = Q1_A - 1.5*IQR_A
lower_A
Upper_A = Q3_A + 1.5*IQR_A
Upper_A
#By Comparing min with lower and max with upper its show that data in American region doesn't have outliers
#Lets visualize and see the outliers in box plot

ggplot(df, aes(x = Region, y = Sales, fill = Region)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sales By Region and Year", x = "Region", y = "Values") +
  theme_minimal()

#Now Lets remove the outlier in data 
df[df$Region=="Europe" & df$Sales<lower_E]
df[df$Region=="Europe" & df$Sales>Upper_E,]

df_new <- df[df$Region=="Europe" & df$Sales<Upper_E,]
head(df_new,5)
df_new <- bind_rows(df_APAC,df_new,df_Americas)
head(df_new,5)
View(df_new)
#After Removing Outlier
ggplot(df_new, aes(x = Region, y = Sales, fill = Region)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sales By Region and Year", x = "Region", y = "Values") +
  theme_minimal()
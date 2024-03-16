library(dplyr)
library(zoo)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/chapter4_assets/chapter4_assets/4_shoe_sale_analysis/shoe_sales.csv")
View(df)
head(df,5)
#minimum sales of Nike Brand
min(df$sold_qty[df$brand=="Nike"],na.rm = TRUE)

#maximum sales of Nike Brand
max(df$sold_qty[df$brand=="Nike"],na.rm = TRUE)

#minimum sales of Nike brand
min(df$sold_qty[df$brand=="Adidas"])
max(df$sold_qty[df$brand=="Adidas"])

#By see the minimum and maximum value i can see the Adidas has outliers because it maximum value is 689. which is really high
#So filling up null value with Average could be messy. So it's better to use median value.

summary(df)  # this code will give us details about the datasets

# Let's split the dataset by brand

df_nike = df[df$brand=="Nike",]
head(df_nike,5)
View(df_nike)
df_nike$date <- as.Date(df_nike$date, format = "%m/%d/%Y")
View(df_nike)
head(df_nike,4)
df_adidas = df[df$brand=="Adidas",]
head(df_adidas,5)
View(df_adidas)
df_adidas$date <- as.Date(df_adidas$date, format ="%m/%d/%Y")
View(df_adidas)
head(df_adidas,5)
summary(df_nike)
summary(df_adidas)
val_nike <- (median(df_nike$sold_qty,na.rm = TRUE))
val_nike
val_nike <- round(val_nike)
val_nike

df_nike[is.na(df_nike)] <- val_nike
View(df_nike)
head(df_nike)
#checking quantile in df_adidas

quantile(df_adidas$sold_qty,0.95)
df_adidas[df_adidas$sold_qty>18.55,]
#Here 689 is very high value.Let replace it with median value

val_adidas<- median(df_adidas$sold_qty)
val_adidas <- round(val_adidas)
val_adidas
df_adidas$sold_qty[df_adidas$sold_qty==689] <- val_adidas
View(df_adidas)
head(df_adidas,5)
#Total Sold quantity of Nike and Adidas
sum(df_nike$sold_qty)
sum(df_adidas$sold_qty)
#Minimum Sales of Nike And Adidas
min(df_nike$sold_qty) 
min(df_adidas$sold_qty)

#Maximum Sales of Nike and Adidas
max(df_nike$sold_qty)
max(df_adidas$sold_qty)
#Avergae sales of bothe Nike and Adidas
mean(df_nike$sold_qty)
mean(df_adidas$sold_qty)

library(ggplot2)

# Create a line plot
ggplot() +
  geom_line(data = df_nike, aes(x = as.Date(date), y = sold_qty), color = "blue") +
  geom_line(data = df_adidas, aes(x = as.Date(date), y = sold_qty), color = "red") +
  xlab("Dates") +
  ylab("Sold Qty") +
  ggtitle("Line Plot with Two Variables from Different Data Frames")


p <- ggplot() +
  geom_line(data = df_nike, aes(x = as.Date(date), y = sold_qty, color = "Nike")) +
  geom_line(data = df_adidas, aes(x = as.Date(date), y = sold_qty, color = "Adidas")) +
  xlab("Dates") +
  ylab("Sold Qty") +
  ggtitle("Line Plot with Two Variables from Different Data Frames") +
  scale_color_manual(values = c("Nike" = "blue", "Adidas" = "red"), 
                     labels = c("Nike", "Adidas"))

p+scale_x_date(date_labels ="%b %d")


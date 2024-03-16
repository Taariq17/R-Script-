library(readxl)
library(dplyr)
df <- read_excel("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/movies_db.xlsx", sheet="movies")
head(df,4)
View(df)

#
standardize_currency <- function(curr){
  if(curr=="$$" || curr=="Dollars"){
    return("USD")
  }else{
    return(curr)
  }
}

df_fin <- read_excel("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/movies_db.xlsx",sheet="financials")
head(df_fin,4)
View(df_fin)
df_fin <- df_fin %>% 
  mutate(currency = sapply(currency,standardize_currency))

head(df_fin,4)

#Merging 
df_merge <- merge(df,df_fin, by="movie_id")
head(df_merge,4)
View(df_merge)

#To save excel file
install.packages("openxlsx")
library(openxlsx)

write.xlsx(df_merge,"D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/movies.xlsx",sheetName="merged",rowNames=FALSE)


#Creating excel file with worksheet
df_stock <- data.frame(
  tickers = c("GOOGL","WMT","MSFT"),
  price = c(845,65,64),
  pe = c(30.37,14.26,30.97),
  eps = c(27.82,4.61,2.12)
)
head(df_stock,2)

df_weather <- data.frame(
  day =c("1/1/2017","1/2/2017","1/3/2017"),
  temperature = c(32,35,28),
  event = c("Rain","Sunny","Snow")
)

df_weather

wb <- createWorkbook()

addWorksheet(wb, "stocks")
writeData(wb,sheet="stocks", x=df_stock)

addWorksheet(wb,"weather")
writeData(wb, sheet="weather", x=df_weather)

saveWorkbook(wb, "D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/Stock.xlsx", overwrite = TRUE)

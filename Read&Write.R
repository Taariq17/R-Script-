df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/stock_data.csv")
head(df,4)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/stock_data.csv",skip=1)
head(df,4)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/stock_data.csv",skip=1,header=TRUE,col.names=c("Stock Symbols", "eps", "revenue", "price", "people"))
head(df,4)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/stock_data.csv",skip=1,nrows = 4)
head(df)
df <- read.csv("D:/R Programing Scripts Practice/R-Script-/CodeBasics Chapter 3 Data/3_read_write_to_excel/stock_data.csv",skip=1,header=TRUE,na.strings = c("not available","-1","n.a."))
head(df,5)
df$pe <- df$price/df$eps
head(df,4)
write.csv(df,file="pe.csv",row.names = FALSE)


library(readxl)
dfs <- read_xlsx("D:/R Programing Scripts Practice/R-Script-/Data/Scatterplot.xlsx")
View(dfs)

#Scatter plot

library(ggplot2)
scatter_p <- ggplot(dfs,aes(x=area_square_ft,y=price))+
  geom_point()
scatter_p # In this plot we can see when the square feet increases, price is also increases.
          #Hence it has positive relation 

# Bubble chart
dfbc <- read_excel("D:/R Programing Scripts Practice/R-Script-/Data/Bubblechart.xlsx")
View(dfbc)
bubble_p <- ggplot(dfbc,aes(x=Revenue,y=`Profit %`,size=Profit,col=Country))+geom_point(alpha=0.95)
bubble_p

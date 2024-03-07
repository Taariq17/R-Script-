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

#Notes
#Scatter plot is a graph that uses a grid to present data values, typically involving two variables 
#within a dataset.
#Scatter plot help to visualize the relationship between two variables.
#A bubble chart is a variation of a scatter plot that allows you to represent a third variables
#through the size of the bubbles.
#Scatter plot and Bubble charts help to detect the outliers, visulaize the relationship
#between two variables and also identify trends
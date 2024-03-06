Category = c("Rent","Restaurants","Groceries","Electricity bill", "Phone Bill")
Amount = c(15000,2000,5100,3200,3500)
data = data.frame(Category,Amount)
View(data)
# install.packages("ggplot2")
library(ggplot2)
#Line chart 
ggplot(data=data,aes(x=Category,y=Amount,group=1))+geom_line()+geom_point()

#Pie chart with geom_text
ggplot(data, aes(x = "", y = Amount, fill = Category)) +
  geom_col() +
  geom_text(aes(label = paste0(round((Amount/sum(Amount))*100),"%")),
             position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y")
#Pie chart with geom_label
ggplot(data, aes(x = "", y = Amount, fill = Category)) +
  geom_col() +
  geom_label(aes(label = paste0(round((Amount/sum(Amount))*100),"%")),
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  coord_polar(theta = "y")

#Horizontal Bar Plot 
ggplot(data)+geom_col(aes(Amount,Category),fill="#076fa2",width=0.6)

#In the above data set the best visualization is pie chart and bar chart
#To my understanding horizontal bar chart will be useful when the categorical name is long and also set a threshold value in bar chart.
#Line chart is best for continuous data and not for categorical data.
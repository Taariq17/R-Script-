library(readxl)
data <- read_excel("Data/histograms.xlsx")
View(data)
df <- read_excel("Data/linechart.xlsx")
View(df)

library(ggplot2)
#Histogram chart with threshold
ggplot(data,aes(x=Exam_Score))+geom_histogram(color="green",fill="lightgreen")
threshold <- 35
ggplot(data,aes(x=Exam_Score))+geom_histogram(binwidth = 10, color="green",fill="palegreen")+
  geom_vline(xintercept = threshold,color="red",linetype="dashed")+
  labs(title="Students Exam Scores Threshold Distribution with Threshold",x="Exam Score",y="Frequency")

#Line chart without legend
ggplot()+
  geom_line(df, mapping = aes(x=Quarter,y=Fridge,group=1),color="red")+
  geom_point(df,mapping = aes(x=Quarter,y=Fridge),color="red")+
  geom_line(df,mapping =aes(x=Quarter,y=Dishwasher,group=1),color="blue")+
  geom_point(df,mapping = aes(x=Quarter,y=Dishwasher),color="blue")+
  geom_line(df,mapping = aes(x=Quarter,y=`Washing Machine`,group=1),color="green")+
  geom_point(df,mapping=aes(x=Quarter,y=`Washing Machine`),color="green")
#Line chart with legend
ggplot(df,mapping=aes(x=Quarter))+
  geom_line(df,mapping=aes(y=Fridge,color="Fridge",group=1))+
  geom_point(df,mapping=aes(y=Fridge,color="Fridge"))+
  geom_line(df,mapping=aes(y=Dishwasher,color="Dishwasher",group=1))+
  geom_point(df,mapping=aes(y=Dishwasher,color="Dishwasher"))+
  geom_line(df,mapping=aes(y=`Washing Machine`,color="Washing Machine",group=1))+
  geom_point(df,mapping=aes(y=`Washing Machine`,color="Washing Machine"))
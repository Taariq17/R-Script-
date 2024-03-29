#GGPlot Demo 
#GGPlot means (Grammar of Graphics)
# Components of Grammar of Graphics

#   Element      Description
#    Data        The data-set for which we would want to plot
#  Aesthetics    The metrics onto which we plot our data
#   Geometry     Visual elements to plot the data
#    Facet       Groups by which we divide the data 

#These five components will make a prefect graph

#Let's visualize the data onto the Aesthetics
#Aesthetics consists of 6 parts and they are : X-Axis, Y-Axis, fill, Col, Shape, Size

library(ggplot2)
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length))# This plot will be blank
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length))+geom_point() # This geom_point function will visualize the data in scatter plot.
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length,col=Species))+geom_point()# Col function will label the data which will provide more better understanding about data. In this code we have passed Species attribute in col function for better understanding about the data.
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length,shape=Species))+geom_point()#Shape function also label the data, which means will passing the Species attributes in shape function it will visualize the data in form shapes like Square,Rectangular and Triangular.
ggplot(data=iris, aes(y=Sepal.Length, x=Petal.Length,col=Species,shape=Species))+geom_point()#In this we have used both col and shape for better visualization about data.

#Housing data 
house = read.csv("Data/Housing.csv") #Importing data
View(house)
library(dplyr)
#Histogram Plot: This plot is used to see the distribution of continuous variables. 

ggplot(data=house,aes(x=price))+geom_histogram() # We are visualizing the price attribute in histogram to check the min,max and most frequently occurred prices of the property.
ggplot(data=house,aes(x=price))+geom_histogram(bins=50) #We are just increasing bins size to 50 because the default bin size is 30.
ggplot(data=house,aes(x=price))+geom_histogram(bins=50,fill="lightblue")#Just coloring the histogram for good presentation.
ggplot(data=house,aes(x=price))+geom_histogram(bins=50,fill="lightblue",col="blue") #In this visualization we are also coloring the boundaries for better presentation.

ggplot(data=house,aes(x=price,fill=airconditioning))+geom_histogram() #I'm just visualization in which price area has most schools
ggplot(data=house,aes(x=price,fill=airconditioning))+geom_histogram(bins=50) #I'm just increasing bins size to 50 from 30.
ggplot(data=house,aes(x=price,fill=airconditioning))+geom_histogram(position = "fill")# I'm just checking proportion when prices increases the air condition is facility is available but then too in some price is air condition is not available.

#Bar plot
ggplot(data=house,aes(x=basement))+geom_bar()# Checking how many house has basement using bar plot
ggplot(data=house,aes(x=basement,fill=airconditioning))+geom_bar(position = "fill")# Checking how many house has basement with air conditioning using bar plot.
ggplot(data=house,aes(x=basement,fill=furnishingstatus))+geom_bar(position = "fill")# Checking how many house has basement with furnished house using bar plot.

#Frequency- Polygon
ggplot(data=house,aes(x=price))+geom_freqpoly()# Frequency polygon is similar to histogram both are checking distribution of continuous variable.Here were seeing the distribution of price attributes.
ggplot(data=house,aes(x=price))+geom_freqpoly(bins=60)#Increasing bin size to 60 from default bin size 30.To understand the variance much deeper.
ggplot(data=house,aes(x=price))+geom_freqpoly(bins=100)#Increasing bin size to 100 to see variance more deeper.
ggplot(data=house,aes(x=price,col=airconditioning))+geom_freqpoly(bins=60)#To get better understand about price distribution we are using air conditioning attribute in color function.

#Box-plot
ggplot(data=house,aes(x=factor(bedrooms),y=price))+geom_boxplot()# I'm just visualizing how prices varies with number of bedrooms.Basically, we can use box-plot when we want see continuous variable change with respect to categorical variable. In this plot bedroom is numerical value but we can use it as categorical using factor function.
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=factor(bedrooms)))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=airconditioning))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=basement))+geom_boxplot()
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=furnishingstatus))+geom_boxplot()

#Smooth line: Smooth line plot is used to see one continuous variable changes with respect to another continuous variable.
ggplot(data=house,aes(y=price,x=area))+geom_smooth()
# In the previous plot you might have seen some shadow overlay plot and that plot is a error. To remove that we have use code se=F
ggplot(data=house,aes(y=price,x=area))+geom_smooth(se=F)
ggplot(data=house,aes(y=price,x=area,col=airconditioning))+geom_smooth(se=F)# In this plot we are adding airconditioning attribute in col variable. To get better understand about the data.
ggplot(data=house,aes(y=price,x=area,col=furnishingstatus))+geom_smooth(se=F)

#LM Method Plot
#In this Linear model plot we will be using two geometer one is geom_points it will plot scatter points and another is geom_smooth it will plot straight line using linear model method.
ggplot(data=house,aes(y=price,x=area))+geom_point()+geom_smooth(method="lm",se=F)
ggplot(data=house,aes(y=price,x=area,col=airconditioning))+geom_point()+geom_smooth(method = "lm", se=F)

#Facet Plots
ggplot(data=house,aes(y=price,x=area,col=airconditioning))+geom_point()+geom_smooth(method = "lm", se=F)+facet_grid(~airconditioning)
ggplot(data=house,aes(y=price,x=area,col=furnishingstatus))+geom_point()+geom_smooth(method = "lm", se=F)+facet_grid(~furnishingstatus)
ggplot(data=house,aes(y=price,x=area,col=airconditioning))+geom_point()+geom_smooth(method="lm", se=F)+facet_grid(~furnishingstatus)
ggplot(data=house,aes(y=price,x=area,col=factor(parking)))+geom_point()+geom_smooth(method = "lm",se=F)+facet_grid(~parking)

#Theme-1 
library(scales)
ggplot(data=house,aes(x=factor(bedrooms),y=price,fill=factor(bedrooms)))+geom_boxplot()->obj1
obj1+labs(title = "Price with respect to bedrooms",x="Bedrooms",y="Price",fill="Bedrooms")->obj2
obj2+theme(panel.background = element_rect(fill="lightblue"))->obj3
obj3+theme(plot.title = element_text(hjust=0.5,face="bold",colour="palegreen"))->obj4
obj4+scale_y_continuous(labels = dollar)

#Theme-2
ggplot(data=house,aes(y=price,x=area,col=airconditioning))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(~airconditioning)->g1
g1+theme(panel.background = element_rect(fill = "palegreen")) ->g2
g2+theme(legend.background = element_rect(fill="lightcyan4")) ->g3
g3+theme(plot.background = element_rect(fill="lightcoral"))

#Theme 3
ggplot(data=house,aes(x=price,col=airconditioning))+geom_freqpoly(size=1,bins=60)+scale_x_continuous(labels = dollar)->p1
p1+theme(panel.background = element_rect(fill="peachpuff"))->p2
p2+labs(title = "Frequency Polygon for Price")->p3
p3+theme(plot.title = element_text(hjust = 0.5),plot.background = element_rect("aquamarine4"))

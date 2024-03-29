#GGPlot Demo
#Using Iris Datasets
View(iris)
#To access the particular column we have to use attribute 
table(iris$Species)
#Scatter Plot : The idea behind this scatter plot is a bivariate analysis that is to understand
#               how does one variable change with respect to another variable and over here.I'm 
#               trying to understand how does sepal length change with respect to petal length 
#               in the left i have given sepal length it will be plotted on Y-Aixs 
#               and on the right i have given petal length it will be plotted on X-Axis.
View(iris$Sepal.Length)
plot(iris$Sepal.Length~iris$Petal.Length)#There is a linear relationship between iris sepal and iris petal.

#To better visualization, I'm going label X-Axis and Y-Axis and add some colours.

plot(iris$Sepal.Length~iris$Petal.Length,ylab = "Sepal Length", xlab = "Petal Length", col="blue",pch=16)

#Histogram Plot: Histogram plot is univariate analysis is to find frequency of the data

hist(iris$Sepal.Width)

#To better visualization:
hist(iris$Sepal.Width,xlab = "Sepal Width", main = "Sepal With Distribution", col="blue")

#Boxplot: To determine how does a continous variable change with respect to a categorical variable

boxplot(iris$Sepal.Length~iris$Species, main="Sepal Length of different Species", col="blue")

boxplot(iris$Petal.Length~iris$Species, main="Petal Length of different Species", col="blue")

#Data Type:Vector
# To declare vector data type in R we have use c in coding, Example: vtr1= c("Hello")
#Vector has 5 Atomic vectors and they are
# 1.Logical : TRUE or FALSE 
# 2.Integer: To declare integer in R we have enter data value as 10L,15L. L denotes as integer in R language
# 3.Numerical : (1,2.4,3.5)
# 4.Complex : (2+1i, 4+3i)
# 5.Character : ("Hello", "A","a","1")
#Vector : Logical 

vtr1 = c(TRUE, FALSE)
vtr1
class(vtr1)
#Vector : Integer

vtr2 = c(10L,15L,20L,1000L)
vtr2
class(vtr2)
#Vector : Numeric

vtr3 = c(10,15,16.5,17,17.5, 21.25)
vtr3
class(vtr3)

#Vector : Complex
vtr4 = c(3+2i, 4+2i)
vtr4
class(vtr4)

#Vector : Character
vtr5 = c("Taariq","Dawood","Buhari","12")
vtr5
class(vtr5)

#Data Type: Matrix
#To declare matrix as data type we have to mention matrix while storing data.Example: x= matrix(c(1:4),2,2)
mat1 = matrix(c(1:4),2,2)
mat1
class(mat1)

#Data Type: Array
#To declare array as data type we have to mention array while storing data. Example: x = array(c(1:4),2,2)
arr1 = array(c(1:4), dim=c(2,2,2,2))
arr1
class(arr1)


#Data Type : List
#To declare list as data type we have to mention list while storing multiple different elements like integer, logical and character etc. Example : x=c(1L,2L,3L) y=c("Hi","da") z=c(TRUE,FALSE) list1 = list(x,y,z)
mylist = list(vtr1,vtr2,vtr3,vtr4,vtr5)
mylist
class(mylist)


#Data Type: Data frame
#To declare data frame as a data type we have to use data.frame syntax. Example : data.frame(data)

v1 = c(1:6)
v2 = c("Taariq","Mohan","Santhosh","Lokesh","Mani","Nanada")
v3 = c(17,17,1,22,18,19)
data = data.frame(v1,v2,v3)
data
class(data)
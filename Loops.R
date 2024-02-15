#Loops 
#Repeat Loop: Repeats a statement or group of statement while a given condition is TRUE. It tests the condition after executing the loop body

var1 = 6

repeat{
  print(var1)
  var1 = var1 + 3
  if (var1 >28){
    break
  }
}

#While Loop: Repeats a statement or group of statement while a given condition is TRUE. It tests the condition before executing the loop body
var1 = 6
while (var1<28){
  print(var1)
  var1 = var1+3
}

#For loop : Repeats a statement or group of for a fixed number of times. It tests the condition before executing the loop body
for (x in 1:25){
  print(x)
}


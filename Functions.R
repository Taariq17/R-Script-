#Functions: A function is a block of organized, reusable code that is used to perform a single, related action.

#Fibonacci Functions
fibo <- function(a){
  var1 = 0
  var2 = 1
  print(var1)
  print(var2)
  for(x in 1:a){
    var3 = var1 +var2
    print(var3)
    var1 = var2
    var2 = var3
  }
}

fibo(6)

#Add Functions
add <- function(a,b){
  return(a+b)
}

add(10,15)

#Subtraction Functions
sub <- function(a,b){
  return(a-b)
}

#Multiply Functions
mul <- function(a,b){
  return(a*b)
}
#Divide Functions
Div <- function(a,b){
  return(a/b)
}

sub(20,10)
mul(5,2)
Div(10,2)

#Function with if else

vote <- function(b){
  if (b==18){
    return("Your are Newer Voter")
  }else if (b>18){
    return("Your are older voter")
  }else if (b<18){
    return("Your are not eligible to vote")
  }else{
    return("Incorrect value")
  }
}
b <- as.integer(readline("Enter Your Age:"))
vote(b)
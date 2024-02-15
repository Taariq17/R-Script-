#String 
a <- "Hi I'm David"
b <- "Hi I'm Taariq"

print(a)
print(b)
print(list(a))
print(class(a))

if (a=="Hi I'm David"){
  print("True")
}else{
  print("False")
}
#concatenation of the string using paste keyword
c <- paste(a,b)
print(c)

#Character count
d <- nchar(c)
print(d)

#Character Case Change
print(toupper(c)) #Upper Case Change
print(tolower(c)) #Lower Case Change

#Substring 
print(substring(c,8,12))
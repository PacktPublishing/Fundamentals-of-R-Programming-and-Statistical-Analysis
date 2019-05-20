#=======================================================
# example 4.3
#=======================================================
x <- 2
while(x < 12){
  x <- x+4
  print(x)
}

repeat{
  x <- x+4
  print(x)
  if (x >=20) { break }
}

x <- 2
repeat{
  x <- x+4
  print(x)
  if(x >=20) { stop("Warning x is greater than 20") }
}

x <- 2
repeat{
  if(x >=20) { stop("too many iterations required") }
  x <- x+4
  print(x)
  
}

x <- 200
repeat{
  if(x >=20) { stop("too many iterations required") }
  x <- x+4
  print(x)
  
}

x <- 1
while(x < 5) {
  x <- x+1; 
  if (x == 3) next;
  print(x)
}

x <- 5
while(x >= 5) {
  x <- x+1; 
  if (x == 7) next;
  print(x)
  if(x>= 10) { break }
}

# Example geting the sum of natural numbers (without using a formula)
# R code modified from http://www.programiz.com/r-programming/examples/sum-natural-number

# Enter number for which we want the sum of natural numbers   
num = 15

if(num < 0) {
  print("Enter a positive number")
} else {
  sum = 0
  
  # use while loop to iterate until zero
  while(num > 0) {
    sum = sum + num
    num = num - 1
  }
  
  print(paste("The sum is", sum))
}



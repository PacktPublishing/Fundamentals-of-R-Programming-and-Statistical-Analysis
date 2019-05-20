#=======================================================
# example 4.2
#=======================================================
x = 12

if(x < 12) { print("x is less than 12") }
if(x <= 12) { print("x is less than or equal to 12") }
if(x < 12){
  print("x is less than 12")
} else {
  print("Sorry x is not less than 12")
}

proteins <- c("MYC", "CCND1", "TP53")
if(proteins=="CCND1") print("yes")

for(i in proteins){
  if(i=="CCND1") print("yes")
}

for(i in proteins){
  if(i=="ANBSC") {
    print("yes")
  } else if (i=="BANANA"){
    print("This is not a gene")
  } else {
    print("Your protein of interest is not found.")
  }
}

for(i in proteins){
  if(i=="MYC") {
    print("yes")
  } else if (i=="BANANA"){
    print("This is not a gene")
  } else {
    print("Your protein of interest is not found.")
  }
}

y <- c(proteins, "BANANA")

for(i in y){
  if(i=="MYC") {
    print("yes")
  } else if (i=="BANANA"){
    print("This is not a gene")
  } else {
    print("Your protein of interest is not found.")
  }
}

ifelse(x<=12, "red", "blue")

plot(x)
plot(x, col=ifelse(x<=12, "red", "blue"))

x <- 1:20
plot(x, col=ifelse(x<=12, "red", "blue"))




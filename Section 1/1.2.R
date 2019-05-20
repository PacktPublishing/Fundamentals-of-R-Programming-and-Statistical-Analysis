 x <- c(1, 2, 3)
 x = c(1, 2, 3)

# Types or Classes of vectors
 integer_vector <- c(1L, 2L, 12L, 29L)

 logical_vector <- c(T, TRUE, F, FALSE)
 
 character_vector <- c("Apple", "Pear", "Red", "Green", "These are my favorite fruits and colors")

# also known as double vector
 numeric_vector <- c(1, 3.4, 5, 10)


 # Let's visualize the contents of the vectors we just created
 integer_vector
 logical_vector
 character_vector
 numeric_vector

# To see the class of your vector
class(integer_vector)
class(numeric_vector)

# To coerce one vector type to another use the as.numeric(), as.character(), as.logical()
x <- as.integer(numeric_vector)
 
 # You can create vectors with mixed elements 
 mixed_vector <- c(character_vector, numeric_vector)
 mixed_vector
 class(mixed_vector)

# To inspect objects
 str(character_vector)
 str(integer_vector)
 str(logical_vector)
 
 # Getting the length of a vector
 length(integer_vector)
 

 
 # Arithmetic operations on vectors
 x <- c(1, 3, 5, 10)
 
 # Multiplications
 x * 2
 
 # Additions
 y <- c(1, 3, 7, 10)
 x + y
 
 # To get the x mod 2 
 x %% 2
 
 ## To perform the integer division x by 5 ##
 x %/% 5

# To perform set operations
x <- c(20, "apple", 3, 12, "nineteen")
y <- c(20, 1, "nineteen", 27, "bell")

intersect(x,y)
setdiff(x,y)
union(x,y)

# Retrieving vector elements by index position
character_vector[5]
numeric_vector[2]

x <- c(1, 4, 6, 12, 45, 33)
x[2]

# To search for elements in your vector with boolean operators
# Boolean operators available: match: %in% ;  equal: == ; NOT EQUAL: != ; AND: && ; OR: || .
# e.g. Let's get the index/position of 12 in the vector x
which(x==12)

# The which function works by returning the indices were a TRUE was found
x=="apple" # return true or false for each index
which(x=="apple")

x <- c(x, "apple")

# you can use the binary operator %in%
which(x %in% "apple")
which(x %in% c("apple", 12))

# Alternatively you can use the match function
match("apple", x)

# but it only returns the first instance 
z <- c(99, 106, "apple", "apple", "pear", 12, 78)

which(z %in% "apple")
match("apple", z) # only returns the index of the first instance of apple

# other use functions to find elements in your vector
fruits <- c("apple1", "apple2", "pear", "banana3", "grapes") 
grep("apple", fruits, fixed=TRUE)

# You can also use regular expressions
grep("apple[1|2]", fruits, fixed=FALSE)

# notice if you keep fixed=TRUE it will look the string as is
grep("apple[1|2]", fruits, fixed=TRUE)

# grepl returns a logical vector (match or not for each element of x).
grepl("^apple", fruits)

which(grepl("^apple", fruits))

# or faster version
startsWith(fruits, "apple")

which(startsWith(fruits, "apple"))

# END

# NEXT VIDEO WORKING WITH LISTS AND ATTRIBUTES



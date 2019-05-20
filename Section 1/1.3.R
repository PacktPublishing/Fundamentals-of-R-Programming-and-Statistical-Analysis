# To create a list we use the list()
simple_list <- list(1:4, rep(3, 5), "cat")
str(simple_list)

# A list can contain many types of objects including other lists
logical_vector <- c(TRUE, TRUE, FALSE)
other_list <- list(1:4, "I prefer pears", logical_vector, x, simple_list)
str(other_list)

# If you combine lists and vectors with the c() function, your vectors will be 
# coexerced into lists of length one
new_list <- c(list(1, 2, simple_list), c(3, 4), seq(5, 6))
new_list

new_list <- c(A=list(1, 2, simple_list), B=c(3, 4), C=seq(5, 6))

# We can see this easier with the str() function
str(new_list)

# Name the contents of simple_list
simple_list <- list(a=1:4, b=rep(3, 5), c="cat")

# You can coerce a vector into a list with the as.list() function
x <- c(1, 3, 5, 10)
x_as_list <- as.list(x)
str(x_as_list)

# To access elements of a list you can use [ ] and/or [[ ]]
simple_list
simple_list[3]

# By entering [3] R returns a single element "cat' 
# i.e. the contents of the 3rd element of the list,
# a list containing the character vector cat
str(simple_list[3])

# If we use double brackets, R returns the object stored in the 3rd element of the list
simple_list[[3]]
str(simple_list[[3]])

# This is important when we want to return objects stored in lists
# Most of the time you want to retrive the object stored in the list
# and not a list of that object. 
str(simple_list[[1]])

# You can store objects stored in lists into new objects
animal <- simple_list[[3]]
animal

num_vector <- simple_list[[1]]
num_vector

# Then retrieve the elements from that object
num_vector[4]

# Instead of creating a new object, you might want to access 
# the 4th element directly from the list as follows:
simple_list[[1]][4]

#Note this format does not return the element
simple_list[1][4] 

# Instead you would need to enter this as follows:
simple_list[1][[1]][4]

# However, in most cases, you would either store the list object in a separate variable
# and work with the object or work with [[ ]][] e.g. simple_list[[1]][4] as above
#-----------------------------------------------------------------------------------

# Attributes can be added to objects you create with the attr() function
attr(x_as_list, "new_attribute") <- "This list contains the number of apples eaten for 3 different days"
attr(x_as_list, "new_attribute")

# The attributes are also shown when you inspect your object with the str() function 
str(x_as_list)

# You can use the structure() function to attach an attribute to an object
structure(as.integer(1:7), added_attribute = "This vector contains integers.")

# R also has built in attributes, such as class(), dim(), and names().
y <- list(first =1:5, second =seq(2, 12, by=10), third=4, fourth=c("a", "b", "c"))
y

# You can get the names of your objects with the names() function
names(y)

# You can change the names as follows:
element_names <- c("first", "second", "third", "fourth")
y <- c(1, 2, 4, 4)
names(y) <- element_names 
y

# Or use the setNames() function
setNames(y, c("alpha", "beta", "omega", "psi"))
names(y)
y["beta"]

# Instead of using index position when retrieving objects or elements stored in lists
# you can use the name as follows:
y <- list(first =1:5, second =seq(2, 12, by=10), third=4, fourth=c("a", "b", "c"))
y[["second"]]

# To remove your the names from your vector you can use the unname() function
unname(y)

# Or use NULL for the names of the vector
names(y) <- NULL
names(y) 

# We will conclude this video looking at a practical example working with attributes 
# to retrieve information stored in venn diagram compartments
# Aim: Create a Venn diagram for differentially expressed gene in condition A and condition B 
genesConditionA <- paste("gene", 1:300)
head(genesConditionA)

genesConditionB <- paste("gene", 150:500)
head(genesConditionB)

# Load the library (make sure to install it first)
require("VennDiagram")

VENN.LIST <- list(ConditionA=genesConditionA, ConditionB=genesConditionB)
venn.plot <- venn.diagram(VENN.LIST , NULL, fill=c("darkmagenta", "darkblue"), alpha=c(0.5,0.5), cex = 2, cat.fontface=4, category.names=c("A", "B"), main="Differentially expressed genes")

# To plot the venn diagram we will use the grid.draw() function to plot the venn diagram
grid.draw(venn.plot)

# To get the list of gene present in each Venn compartment we can use the gplots package
require("gplots")

a<-venn(VENN.LIST, show.plot=FALSE)
str(a)

# By inspecting the structure of the a object, 
# you notice two attributes: 1) dimnames 2) intersections
# We can store the intersections in a new object inters
inters<-attr(a,"intersections")

# ConditionA specific genes
A_specific <- inters$ConditionA
B_specific <- inters$ConditionB

# You can see the first elements of the B_specific genes as follows
head(B_specific)

# Otherwise you can summarise the genes present 
# in 1) ConditionA only, 2) ConditionB only, 3) ConditionA & ConditionB
lapply(inters, head) # more on this function in video 2.4











 # To create multidimensional arrays with the array() function
 coordinates <- array(1:16, dim=c(2, 8, 2))
 coordinates
 
 # To create arrays with the dim() function
 values <- seq(1, 12, by=2)
 values
 dim(values) <- c(2,3)
 values
 dim(values) <- c(3,2)
 values
 
 # To retrieve elements by position in multidimensional arrays
 coordinates
 coordinates[1, , ]
 
 coordinates[1, 2, ]
 
 coordinates[1, 2, 2]
 
 # To create a matrix in R with the matrix() function
 values_matrix <- matrix(values, ncol=3, nrow=2)
 values_matrix
 
 # To create a matrix with 2 vectors and the rbind() or cbind() function
 x <- c(1,5,9)
 y <- c(3,7,11)
 m1  <- rbind(x, y)
 m1
 m2 <- cbind(x,y)
 m2
 
 # To retrieve elements stored in a matrix by position
 values_matrix[2,2]
 
 # Matrices and arrays are also indexed as a vector, 
 # so you could retrieve the value of y with values_matrix[4]
 values_matrix
 values_matrix[4]

 coordinates
 coordinates[3]
 
 # Useful attributes when working with matrices and arrays
 # To get the number of elements 
 length(coordinates)
 
 # To get the number of columns 
 ncol(values_matrix)
 nrow(values_matrix)
 
 # To retrieve or change the column names of a matrix
 colnames(values_matrix)
 colnames(values_matrix) <- c("Column_A", "Column_B", "Column_C") 
 values_matrix
 
 # To change the row names 
 rownames(values_matrix) <- c("A", "B")
 values_matrix
 
 # To get the dimension of an array
 dim(coordinates)
 
 # To retrieve or change the dimnames  
 dimnames(coordinates) <- list(c("alpha", "beta"), c("a", "b", "c", "d", "e", "f", "g", "h"), c("X", "Y"))
 coordinates

 # Use as.matrix() or as.array() to convert your object to a matrix or array
 x <- c(1, 6, 12)
 as.matrix(x)
 as.array(x)

 # Example to show that x can be stored as a one dimensional array 
 # and a matrix of a single column or row

 str(x)
 str(array(x, 3)) 
 str(matrix(x, ncol=1))
 str(matrix(x, nrow=1))


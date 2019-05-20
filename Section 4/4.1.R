#=======================================================
# example 4.1
#=======================================================
# for(i in vector){commands} statement allows you to repeat 
# the code written in bracket { } for each element (i) 
# in your vector in the parenthesis

for(i in 1:12){
	print(i)
}

for(i in 1:12){
	y <- i+10
	print(y)
}

# For example to modify gene names 
genes <- c("Ier2", "Ier2", "Vmn1r70", "Mir106a", "Gm17064")

# Vector to store new gene ids
newgenenms <- c()
for(i in genes){
	newrn <- paste(i, "1", sep="-")
	newgenenms <- c(newgenenms, newrn)
}

# Print the contents of the newgenenms object
newgenenms

# For example to make gene names unique to use as rownames
genes <- c("Ier2", "Ier2", "Vmn1r70", "Mir106a", "Gm17064")
genenums <- seq(1, 5)

# Vector to store new gene ids
newgenenms <- c()
for(i in 1:5){
	newrn <- paste(genes[i], genenums[i], sep="-")
	newgenenms <- c(newgenenms, newrn)
}

# Print the contents of the newgenenms object
newgenenms

# Alternatively, we could have written genenums instead of 1:5
newgenenms <- c()
for(i in genenums){
	newrn <- paste(genes[i], i, sep="-")
	newgenenms <- c(newgenenms, newrn)
}
newgenenms

# For example to make gene names unique to use as rownames
genes <- c("Ier2", "Ier2", "Vmn1r70", "Mir106a", "Gm17064")
geneletters <- letters[1:5]

newgenenms <- c()
for(i in 1:5){
	newrn <- paste(genes[i], geneletters[i], sep="-")
	newgenenms <- c(newgenenms, newrn)
}
newgenenms

# How long does it take? using the system.time() function
genes2 <- sample(genes, 10000, replace=TRUE)
geneletters2 <- sample(geneletters, 10000, replace=TRUE)

newgenenms <- c()
system.time(for(i in 1:10000){
	newrn <- paste(genes2[i], geneletters2[i], sep="-")
	newgenenms <- c(newgenenms, newrn)
})
tail(newgenenms)

# Instead of for loops we can use the apply function
df <- cbind(genes2, geneletters2)
head(df)
system.time(newgenenms <- apply(df, 1, function(x) paste(x[1], x[2], sep="-"))) 

# system.time() returns the user, system, and total 
# elapsed times for the currently running R process

# Conclusion:
# The apply function is much more efficient than for loop in this case

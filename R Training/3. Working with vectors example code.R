

###########################################
##   WORKING WITH VECTORS EXAMPLE CODE   ##
###########################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================
#### Working with vectors ####

# Vectors: sequence of data elements of the same data type
# use c() to concatenate(bind) the numbers together


#### Creating a vector ####

A = c(3, 1.4, 5.25, 34)           # Vector with numbers
B = c("Hello", "Hola", "Bonjour") # Vector with strings
D = c(TRUE, TRUE, FALSE)          # Vector with Booleans


#### Operations on vectors ####

2 + c(10, 12, 5, 6)
c(10, 12, 5, 6) - 2
E = c(10, 12, 5, 6)

E * 5
E/2

#### Working with multiple vectors ####

# Note: the vectors need to be the same length

c(1, 3, 5, 7) + c(2, 4, 6, 8) 

c(1,3,5,7) - c(2,4,6,8)

c(1,2,3,4) * c(2,3,4,5)

c(2,4,6,8)/c(2,4,6,8)

#### Assigning vectors to a variable ####

A <- c(1, 4, 7, 11)
B = c(2, 6, -4, 13)

A/B

#### Assigning vectors to descriptive variables ####

vegetable.servings = c(3, 4, 4, 1, 2)
fruit.servings = c(1, 0, 3, 2, 1)

healthy = fruit.servings + vegetable.servings
healthy

#### Replacing elements in a vector ####

A
A[3] = 10
A

A[1]
A[1:3]

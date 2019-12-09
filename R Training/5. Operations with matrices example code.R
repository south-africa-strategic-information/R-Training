#############################################
##  OPERATIONS WITH MATRICES EXAMPLE CODE  ##
#############################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

#### Adding matrices ####

mat.1 = matrix(1:6, 2)
mat.1
mat.2 = matrix(c(2,2,2,3,3,3), 2, byrow = T)
mat.2

mat.3 = mat.1 + mat.2
mat.3

mat.3 + 2

#### Subtracting matrices ####

mat.4 = mat.1 - mat.2
mat.4
mat.2 - 2

#### Multiplying matrices ####

mat.5 = mat.1 * mat.2 

mat.2 * 5


#### Dividing matrices ####

mat.6 = mat.1/mat.2
mat.6
mat.1/6

#### Combining matrices ####

dim(mat.1)
dim(mat.2)
cbind(mat.1, mat.2)
rbind(mat.1, mat.2)

#### Sums of rows and columns ####

# rowSums adds up the rows of a matrix and creates a vector
# colSums adds up the columns of a matrix

mat.1.rowsum = rowSums(mat.1)
mat.1.rowsum

mat.1.colsum = colSums(mat.1)
mat.1.colsum


##########################################
##  WORKING WITH MATRICES EXAMPLE CODE  ##
##########################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

#### Create a matrix ####

# A matrix has data elements of the same type
# arranged in rows and columns

# Matrix function is matrix()

# This matrix is created with a range of numbers
# between 1 and 6 inclusive, with 3 rows and 2 columns

mat1 = matrix(c(1:6), nrow = 3, ncol = 2)
mat1

# Use the byrow function so the data goes across rows

mat1 = matrix(c(1:6), nrow = 3, ncol = 2, byrow = T)
mat1

# This matrix is created with a vector 

mat2 = matrix(c(1,2,3,4,5,6), 3, 2)
mat2

# You can also do it by assigning a vector to a variable

G = c(1,2,3,4,5,6)
mat3 = matrix(G, 3, 2)
mat3

# Or this way, just with the variable and the number of rows

mat4 = matrix(G, 3)
mat4
 
# What if you want 2 columns instead of 2 rows?

mat5 = matrix(G, ncol = 2)
mat5

# What if you want to combine vectors?

G = c(5, 6, 7, 8, 9, 10)
H = c(11, 12, 13, 14, 15, 16)

mat6 = matrix(c(G,H), 2, byrow = T)
mat6

# You can use rbind or cbind to combine named vectors

weekly.lows = c(60, 62, 65, 59, 57, 58, 60)
weekly.highs = c(79, 80, 82, 78, 75, 77, 75)

mat7 = rbind(weekly.lows, weekly.highs)
mat7

#### Customizing matrices in R ####


class(mat7)          # Class of matrix with class()  
dim(mat7)          # Dimensions of matrix with dim()
length(mat7)          # Length of matrix with length()

# Add column with cbind()

mat8 = cbind(mat6, c(11,12))
mat8

# Add row with rbind()

mat9 = rbind(mat8, c(13, 14, 15, 16, 17, 18, 19))
mat9

# Transpose matrix

mat10 = t(mat9)
mat10

# Add row names with rownames

rownames(mat10) = c("Row1", "Row2", "Row3", "Row4", 
                    "Row5", "Row6", "Row7")
mat10

# Add column names with colnames

colnames(mat10) = c("Col1", "Col2", "Col3")
mat10
# Add row and column names with dimnames 

dimnames(mat1) = list(c("Row1", "Row2", "Row3"), 
                      c("Col1", "Col2"))
mat1


#==================================================================================


#### Adding matrices ####

mat.1 = matrix(1:6, 2)
mat.1

mat.2 = matrix(c(2,2,2,3,3,3), 2, byrow = T)
mat.2

mat.3 = mat.1 + mat.2
mat.3

mat.1 + 2

#### Subtracting matrices ####

mat.1 - mat.2
mat.1 - 2

#### Multiplying matrices ####

mat.1 * mat.2
mat.1 * 10

#### Dividing matrices ####

mat.1 / mat.2
mat.1/6

#### Combining matrices ####

dim(mat.1)
dim(mat.2)

mat.4 = cbind(mat.1, mat.2)
mat.4

mat.5 = rbind(mat.1, mat.2)
mat.5

#### Extracting information from matrices ####
# Use the square brackets [ ] to identify the element you want to pull

# The element in the second row and third column of mat8

mat8[2,3]

# The tenth element in mat8 (will count elements by going down columns, not across rows)

mat8[10]

# The first row of mat7
# If you want the entire row, put a comma after the row number you want

mat7[1,]

# The second column of mat8
# If you want the entire column, put a comma before the column number you want

mat8[,2]


# Replacing a matrix element
# Specify which element you want to replace and then set it equal to a different value

mat8[2,3]
mat8[2,3] = 18
mat8[2,3]

#### Sums of rows and columns ####

# rowSums adds up the rows of a matrix and creates a vector
# colSums adds up the columns of a matrix

rowSums(mat8)
colSums(mat8)

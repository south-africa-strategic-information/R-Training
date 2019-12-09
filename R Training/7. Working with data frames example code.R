#############################################
##  WORKING WITH DATA FRAMES EXAMPLE CODE  ##
#############################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# A data frame is a table that contains different data types.
# You can create a data frame with the data.frame() function


#### CREATING A DATA FRAME ####

# Use the function data.frame()


# Create one from scratch

df1 = data.frame("Age" = c(18, 25, 48),
                 "Label" = c("A", "B", "C"),
                 "Name" = c("Bill", "Mike", "Jon"))
 
df1

# Create one from vectors

j = c("Joe Smith", "Jane Johnson", "Dave Jones")
k = c(23, 27, 30)
l = c(TRUE, TRUE, FALSE)

df2 = data.frame(j, k, l)
df2

# Pull out specific values, rows, or columns

df2[1,2]

df2[1,]

df2[,1]

# Make sure you have installed and loaded the 'datasets' package to 
# access this dataset. 
# Note: there are plenty data sets built into R packages. In order to 
# see a list of them, type in 

data(package = .packages(all.available = TRUE)) 

install.packages("datasets")
library(datasets)

View(HairEyeColor)
class(HairEyeColor)    #  <- Here we see this data set is a table


# Creating a data frame from a table with the as.data.frame() function

HEC = as.data.frame(HairEyeColor)
class(HEC)

#### Exploring data frames ####

# Dimensions of the data frame with dim()

dim(HEC)  # <- first number is rows, second number is columns

# Get the names of the data frame with names()

names(HEC)  # <- shows the variables of the data frame

# See the structure of the data frame with str()

str(HEC)

# See a summary of the data with summary()

summary(HEC)

# Let's pull another data set, called Cars93 from the 'MASS' package
# For more information about the package, type in ?Cars93

install.packages("MASS")
library(MASS)
View(Cars93)
?Cars93


# What are the first few entries of this data set?
# The head function pulls the first rows to show the data type

head(Cars93)


# Look up the number of car manufacturers by viewing levels
# (identifies unique categories in a column)
# Note: the category must be a factor in order for R 
# to run the function properly

as.factor(Cars93$Manufacturer)
levels(Cars93$Manufacturer)

# Let's subset these columns. First, what categories are we working with?
# Use the names() function

names(Cars93)

# We want Manufacturer, Model, Type, Price, MPG.city, MPG.highway, 
# Passengers. You can pull the information with the $ 

Cars.sub = data.frame(Cars93$Manufacturer, Cars93$Model, Cars93$Type, 
                      Cars93$Price, Cars93$MPG.city, Cars93$MPG.highway, 
                      Cars93$Passengers)
View(Cars.sub)

# Or shorten the code by identifying the columns you want
# Here, we put a comma in right after the square brackets to tell R 
# that we're specifying columns. Then, we list the column numbers we 
# want (this is where the names function comes in handy!)

Cars.sub = data.frame(Cars93[,c(1:3, 7, 8, 18)])
View(Cars.sub)

# How many of these cars are sporty?
# Use the grep()function to search for a word in a particular column
# If you don't specify the column, it will come back without results

Sporty.type = grep("Sporty", Cars.sub$Type)
View(Sporty.type)

length(Sporty.type)

# What if we want to see the summary of all car types?
# Use the table function to count up the number of occurrences of 
# each car type

car_Type_summary = table(Cars.sub$Type)
View(car_Type_summary)

car_Man_Type_sum = table(Cars.sub$Type, Cars.sub$Manufacturer)
View(car_Man_Type_sum)

# Let's look at the original data set by increasing MPG.city numbers
# Note: for new versions of RStudio, you can use the up and down 
# arrows near the column title

Cars93_order = Cars93[order(Cars93$MPG.city, decreasing = F),]
View(Cars93_order)

# Let's only look at compact cars by using the subset() function

Cars93_Compact = subset(Cars.sub, Type == "Compact")
View(Cars93_Compact)

# Here we can see cars with miles per gallon above 30 in the city 

Cars93_MPG = subset(Cars.sub, MPG.city > 30)
View(Cars93_MPG)

# What if I want the average MPG?

MPG.Avg = ((Cars.sub$MPG.city + Cars.sub$MPG.highway)/2)
View(MPG.Avg)

# Now bind the data set with this new column

Cars.sub = cbind(Cars.sub, MPG.Avg)
View(Cars.sub)

# Order the cars by increasing MPG

Cars.sub.order = Cars.sub[order(Cars.sub$MPG.Avg, decreasing = F),]
View(Cars.sub.order)


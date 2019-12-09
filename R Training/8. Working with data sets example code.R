#############################################
##   WORKING WITH DATA SETS EXAMPLE CODE   ##
#############################################

## NOTE: To run individual pieces of code, 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# One of the best features of R is its data sets. Each package comes with 
# preloaded data that are excellent for practice. Type in the code below 
# to see the list of data sets that are readily available to you. Make 
# sure you install and load the package where the data set is from in 
# order to access it.

data(package = .packages(all.available = TRUE))

# We'll be working with the cereal data set - UScereal from the 
# 'MASS' package

install.packages("MASS")
library(MASS)
View(UScereal)

# What do these columns mean?

?UScereal

# What does our data look like? Use the head() and names() function

head(UScereal)
names(UScereal)

# What are some of the values in this data?
# Extract specific values from the data set with square brackets

UScereal["Apple Jacks", "calories"]
UScereal[1:4, "calories"]
UScereal[5, 9]

# Let's round these decimals to one place with the round() function and 
# set it equal to UScereal_rounded. Since the first and last columns are
# not numbers (R does not count row.names as a column), we will subset it.

UScereal_rounded = round(UScereal[,2:10], 1)
View(UScereal_rounded)

# Now, let's put those cbind those columns with the first and last 
# columns of the original data set.

UScereal_2 = cbind(UScereal$mfr, UScereal_rounded,
                  UScereal$vitamins)
View(UScereal_2)

# Since the column names didn't transfer, let's redo that code and 
# set those columns equal to the names that we want

UScereal_2 = cbind("manufacturer" = UScereal$mfr, UScereal_rounded,
                   "vitamins" = UScereal$vitamins)
View(UScereal_2)

# We don't need the columns 'shelf' or 'potassium', so we can take 
# those out by setting those columns equal to NULL

UScereal_2[,"shelf"] = NULL
UScereal_2[,"potassium"] = NULL
View(UScereal_2)

# We're going to use an if-else statement to determine whether a cereal 
# is healthy or not healthy.
# If a cereal has more than 150 calories per serving and more than 15 
# grams per sugar, we will label it unhealthy. Otherwise, we'll label 
# it as healthy. 

UScereal_2$Healthy = ifelse(UScereal_2$calories > 150 & UScereal_2$sugars > 15, 
                 "Unhealthy", "Healthy")
View(UScereal_2)


# Continue to practice these operations until you feel
# comfortable in R. The only way to become truly
# proficient is to spend time coding!
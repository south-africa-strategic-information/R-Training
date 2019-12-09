############################################
##   WORKING WITH PACKAGES EXAMPLE CODE   ##
############################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# Packages are built by R users and are usually updated regularly. Whenever 
# you load a package, you can look at all its functions by clicking on the 
# name in the packages window of RStudio.

# We will be using the data frames from Exercise 8: Working with data sets, 
# so make sure those data sets are still loaded in RStudio. If not, rerun 
# the code from that exercise.

# Let's use the plyr to analyze the data more - this package can help you 
# manipulate the data more easily

install.packages("plyr")
library(plyr)
?plyr

# Here we can use ddply to tally the number of rows by manufacturer with
# nrow


UScereal_group = ddply(UScereal_2, .(manufacturer), nrow)
View(UScereal_group)

?UScereal

# Here, we see the average calories by manufacturer with the summarize
# function

UScereal_man = ddply(UScereal_2, .(manufacturer), summarize,
                     mean_cals = mean(calories))
View(UScereal_man)

# We can get the mean for all the columns by manufacturer with
# numcolwise()

UScereal_summary = ddply(UScereal_2, .(manufacturer), numcolwise(mean))
View(UScereal_summary)

# But we might not want all of them - so let's subset so we only have 
# calories, fat, carbohydrates, and protein averages -> c(1:4, 7)

UScereal_summary = subset(UScereal_summary[,c(1:4, 7)])
View(UScereal_summary)

# If we want to combine that information into our data set, we need to 
# rename the columns so R doesn't overlap them.

UScereal_rename = rename(UScereal_summary, c("calories" = "avg.cals",
                                             "protein" = "avg.pro",
                                             "fat" = "avg.fat",
                                             "carbo" = "avg.carbs"))
View(UScereal_rename)

# Let's round columns 2:5 with the round() function to make them easier 
# to read 

UScereal_rename = round(UScereal_rename[,c(2:5)], 1)
View(UScereal_rename)

# And add the manufacturer column back in to that data set with cbind()

UScereal_rename = cbind("manufacturer" = UScereal_summary$manufacturer, 
                        UScereal_rename)
View(UScereal_rename)

# Now we can join UScereal_rename with UScereal_2 so we can compare 
# each cereal to the average
# join() is a plyr function, make sure the package is loaded before using it

UScereal_avg = join(UScereal_rename, UScereal_2, by = "manufacturer")
View(UScereal_avg)

# Set the directory where you'd like your files to save to
# Remember that Macs use the ~/ directory whereas Windows uses 
# the C:/ directory

setwd("~/Desktop")

# Save the file you created

write.csv(UScereal_avg, "UScereals.csv")

# Continue to practice these operations until you feel
# comfortable in R. The only way to become truly
# proficient is to spend time coding!
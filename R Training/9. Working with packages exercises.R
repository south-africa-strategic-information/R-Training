#######################################################

#########################################
##   WORKING WITH PACKAGES EXERCISES   ##
#########################################

## NOTE: To run individual pieces of code, 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# Packages are built by R users and are usually updated regularly. When you load
# a package, you can look at all its functions by clicking on the name in the packages
# window of RStudio.

# We will be using the state.pop.health data from Exercise 8: Working with data sets  
# exercises, so make sure those data sets are still loaded in RStudio. If not, rerun 
# the code from that exercise.

# Let's use the plyr package to analyze the data more - this package can help you 
# manipulate the data more easily.

install.packages("plyr")
library(plyr)

# 1. Find the average for all the columns by state.region and label the new data set
#    as state.pop.avg.



# 2. Subset the state.pop.avg data set so it just includes state.region, population, 
#    life expectancy, murder, and high school graduation. Keep the name the same.
#    Note: you can either delete the columns from the existing set or create a new set.



# 3. Round the columns from state.pop.avg to 1 decimal point and name it state.pop.round.



# 4. Add the state.region column back in with the proper name and label it state.pop.round.



# 5. Rename the columns of state.pop.round to the following:
#    Population = Avg.Pop
#    Life Exp = Avg.Life.Exp
#    Murder = Avg.Murder
#    HS Grad = Avg.HS.Grad



# 6. Combine state.pop.round and state.pop.health by state.region and label it state.avg.



# 7. Create an ifelse statement that specifies if the Avg.Life.Exp column is greater than the state's  
#    Life Exp column and the Avg.Murder is less than the state's Murder, label it "Needs Improvement". 
#    Otherwise, label it "Satisfactory". Name the column 'state.health.comp' and add it
#    to the state.avg data set. 



# 8. Remove the following columns from the state.avg data set: Avg.Pop, Avg.HS.Grad, Population, Income, Illiteracy
#    HS Grad, and state.health. Label this as 'state.avg.clean'.



# 9. Now we need to add the state names back in. Add the row names from state.pop.health as 
#     a column called 'state.names' in the data set state.avg.clean.



# 10. Set the directory you want and save the data set as a CSV titled "State.avg.clean.csv".



# Continue to practice these operations until you feel
# comfortable in R. The only way to become truly
# proficient is to spend time coding!
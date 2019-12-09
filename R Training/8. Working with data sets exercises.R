################################
##   WORKING WITH DATA SETS   ##
################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# One of the best features of R is its data sets. Each package comes with preloaded data
# that are excellent for practice. Type in the code below to see the list of data sets that 
# are readily available to you. Make sure you install and load the package where the data 
# set is from in order to access it.

data(package = .packages(all.available = TRUE))

# We'll be working with a population data set, state.x77, from the 'MASS' package

install.packages("MASS")
library(MASS)
View(state.x77)

# 1. What does the "Frost" column mean? Use the '?state.x77' to find out!



# 2. What do the first few rows look like?



# 3. What are all the categories in the data set?



# 4. If you were unable to find the categories, check the class of the data. If it is
# not a data frame, change it into a data frame and save it as state.pop.



# 5. What are the categories for state.pop?



# 6. What is the high school graduation rate for Florida?



# 7. How about the life expectancy of Virginia?



# 8. Bind the state.pop data set with the state.region data set and keep the name as 
#    state.pop



# 9. Take out the Frost and Area columns



# 10. If a state has a murder rate above 10% and a life expectancy below 70, label it
#     as "Needs Improvement". Otherwise, label it as "Satisfactory". Name this new data
#     "state.health"



# 11. Combine the state.pop data set and the state.health column and call it 
#     state.pop.health



# 12. Order the data set by state.region, set the decreasing order to false and keep it named as
#     'state.pop.health'



# 13. Are there any observations you can make about the health of states by region?

# 
# Continue to practice these operations until you feel
# comfortable in R. The only way to become truly
# proficient is to spend time coding!
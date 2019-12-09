################################
##  WORKING WITH DATA FRAMES  ##
################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

# A data frame is a table that contains different data types.


# 1. Create a data frame named df.1 from scratch with the following vectors:
#    Name = Rob, Jaime, Jon
#    Age = 18, 30, 20
#    Family = Stark, Lannister, Snow



# 2. Create a data frame named df.2 with the following lists:
#    Hint: create vectors of each category
#
#    Buster = 34, male, Bluth
#    Gob = 39, male, Bluth
#    Lindsey = 37, female, Funke
#    Tobias = 39, male, Funke
#    Michael = 37, male, Bluth



# There are plenty data sets built into R packages. In order to see a list of them,
# type in data(package = .packages(all.available = TRUE)) 

# Install and load the ggplot2 package and pull up the mpg data set

View(mpg)

# 3. What are the dimensions of the data frame? How about the categories?



# 4. Call up the first few rows of the data frame



# 5. What does the structure look like?



# 6. How many categories are there in the 'class' column and what are they?
#    Hint: in order to use the levels function, the 'class' column needs to 
#          be read as a factor. You can use the as.factor() function to
#          change the structure of the data - make sure to specify the column you 
#          want to change. The str(class) code will tell you how the data is read in.


# 7. What are all the categories in the data set?



# 8. Subset the data with only the manufacturer, model, class, cty, hwy and label
#    the data as mpg_sub



# 9. How many cars are compact? Create a new variable called "Compact.mpg" that
#    contains that information.



# 10. How many types of each car were released? Create a variable "car_type_mpg" that
#    displays a table of this information



# 11. How many of each car type were released by each manufacturer? Label this table
#    type_manu_mpg



# 12. What type of data is this? Use the class function to find out. If it's not a data frame,
#    convert it to a data frame and save it as the same name.



# 13. Rename the columns as "Class", "Manufacturer", and "Frequency"



# 14. We only want to look at the categories that have a frequency higher than 0. 
#     Subset type_manu_mpg so it only shows the rows with at least 1 frequency and 
#     label it type_manu_freq



# 15. Put the information from type_manu_freq in decreasing order by the Frequency column
#     and keep the data under the same name



# 16. Let's go back to the mpg_sub data set, and subset all data to display highway
#     miles per gallon (column named 'hwy') above 25 and label it cars_mpg_25



# 17. Create a new column with the average MPG by taking the average of the cty and hwy columns.
#     Label this new column as avg.mpg



# 18. Add that column to our cars_mpg_25 data set and keep it named the same



# 19. Now, let's subset all the columns except for hwy and cty and name
#     it efficient_cars



# 20. Order the efficient_cars data set decreasing by avg.mpg



# Continue to practice these operations until you feel
# comfortable in R. The only way to become truly
# proficient is to spend time coding!

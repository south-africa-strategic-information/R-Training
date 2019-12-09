
#___________________________________________________________________________
#~~~~~~~~~~~      _____   _             _       _                ~~~~~~~~~~~~~~~
#~~~~~~~~~~~     |  __ \ | |           (_)     (_)               ~~~~~~~~~~~~~~~ 
#~~~~~~~~~~~     | |__) || |_ _ __ __ _ _ _ __  _ _ __   __ _    ~~~~~~~~~~~~~~~
#~~~~~~~~~~~     |  _  / | __| '__/ _` | | '_ \| | '_ \ / _` |   ~~~~~~~~~~~~~~~
#~~~~~~~~~~~     | | \ \ | |_| | | (_| | | | | | | | | | (_| |   ~~~~~~~~~~~~~~~
#~~~~~~~~~~~     |_|  \_\ \__|_|  \__,_|_|_| |_|_|_| |_|\__, |   ~~~~~~~~~~~~~~~
#~~~~~~~~~~~           ______                            __/ |   ~~~~~~~~~~~~~~~
#~~~~~~~~~~~          |______|                           \___/   ~~~~~~~~~~~~~~~
#___________________________________________________________________________


# R Studio Projects -------------------------------------------------------
# R Studio projects are a great feature which allow you to have one dedicated session for each project you are working on
# One of the great features is that it sets the working directory to the project folder automatically so others can easily
# work off the same file without having to adjust their file paths (and everything is step up the exact same).
# To start an R Project that already exists, double click on the .Rproj file in the folder.
# If you have not opened this session via the .Rproj file, you will need to so that all the file paths work the same on your machine





#-------------------------------------------------------
# ---- (0) Loading Tidyverse Package (Slide )----- 
#--------------------------------------------------------
# R is built of packages that have to be independently installed the first time you use them, install.packages()
install.packages("tidyverse")
# Every time you open R, you will need to "open" or load your packages, using library()
library(tidyverse)

# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

#Please load the tidyverse package







#-------------------------------------------------------
# ---- Importing TXT datafile ----- 
#--------------------------------------------------------
# function used is 'read_tsv' & its arguments (file path and/or name), 
# reads in txt file named "ex1_data.txt", and stores dataset as an object named 'txt' 
# object <- function(relative file path/filename.txt)


# Getting HELP  
?read_tsv
help("read_tsv")
 


# Relative folder paths
# Subfolder in project - dependent on setting the working directory properly  
msd_path <- file.choose()
txt <- read_tsv(msd_path)


# Specifying the type of each variable being pulled in
# This is really important since R reads in the first 1000 lines and then guesses what the column type is
# If you don't have any targets data in the first 1000 lines for example, it will be read in as string

#             "c" = character 
#             "i" = integer 
#             "n" = number 
#             "d" = double (includes decimals)
#             "l" = logical 
#             "D" = date 
#             "T" = date time 
#             "t" = time 
#             "?" = guess


# Add customized variable types for accuracy
txt2 <- read_tsv(file = msd_path, 
                    col_types = cols(mech_code            = "c",
                                     ageasentered         = "c",            
                                     trendsfine           = "c",     
                                     trendssemifine       = "c",    
                                     trendscoarse         = "c",      
                                     sex                  = "c",     
                                     hiv_treatment_status = "c",     
                                     otherdisaggregate    = "c",     
                                     coarsedisaggregate   = "c",     
                                     fiscal_year          = "d",
                                     targets              = "d",      
                                     qtr1                 = "d",      
                                     qtr2                 = "d",      
                                     qtr3                 = "d",      
                                     qtr4                 = "d",
                                     cumulative           = "d"
                                     ))


# Check your data classes for all variables
spec(txt2)



# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 1. Import your dataset (.txt file) and name it dataset1
# Feel free to copy and paste from lesson script






rm(txt) #removes object



#-------------------------------------------------------
# ---- Ways to View your dataset(s) ----- 
#--------------------------------------------------------
View(txt2)  # to see entire dataset
names(txt2) # to see variable names
spec(txt2)  # to see variable names and variable types
glimpse(txt2) #combines view of names, specs, and the first few rows of data



# View() allows you to see the entire dataset as we saw above
# you can narrow down that view by taking a "slice" of a number of rows and/or selecting certain columns
#look a the first 20 rows  

slice(txt2, 1:20)
View(slice(txt2, 1:20))



# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 2a. View your entire dataset1
# 2b View the names of all of your variables in your dataset1
# 2c. View the top 40 rows of dataset1 using the slice function






# The dplyr function, 'select' allows for specifiying any number of variables to retain and view.
select(txt2, operatingunit, psnu, region) #this gets cut off
View (select(txt2, operatingunit, psnu, region)) # to show all rows


# look at the first 3 columns and first 20 columns
View(select(slice(txt2, 1:20), region:operatingunit))


# To retain variables that start with or end with a certain string pattern. 
select(txt2, ends_with("year"))
select(txt2, starts_with("qtr"))

# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 2d Create a new dataframe called dataset2 and retain the following columns from dataset1 and view their data: 
# operatingunit, psnu, region, indicator. 








# The dplyr functions, 'distinct' and 'count' show a breakdown of a column's unique values. 
distinct(txt2, operatingunit)
count(txt2, operatingunit) # count gives you the values and the # of rows whereas distinct only displays values
count(txt2, region, operatingunit, psnu, snu1)
View (count(txt2, region, operatingunit, psnu, snu1)) 

#option to allow you to easily sort
count(txt2, operatingunit, sort = TRUE) 


#by adding in the weight, allows for easy aggregation, similar to pivot table "sum"
# 'n' now reports aggregate value for qtr4 instead of # of rows
count(txt2, operatingunit, wt = qtr4, sort = TRUE)


#when view is longer than 10 rows, use View()
count(txt2, region, operatingunit, psnu, snu1, sort = TRUE)
View( count(txt2, region, operatingunit, psnu, snu1, sort = TRUE))
View( count(txt2, region, operatingunit, psnu, snu1, wt = qtr4, sort = TRUE))


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 2e View the number of unique values in your operatingunit column and in your psnu columns for dataset2
# 2f do 2e, but add cumulative for the "wt" option and sort = TRUE as well  






# In Session 2, we will revisit Exploring the dataset
# we will look at a streamlined way to simulate looking at aggregate counts,
# which is very smiliar to pivot tables in excel
# This method will use the functions, group_by and summarise
  


#-------------------------------------------------------
# ---- Sorting your dataset ----- 
#--------------------------------------------------------

# Sort variables using 'arrange' function from dplyr

# Sorting in ascending order (default) 
sorted <- arrange (txt2, psnu)
select(sorted, psnu)   # Doesn't display all rows
View(select(sorted, psnu))   # Using 'View" shows all rows
View(count(sorted, psnu))   #distinct psnus in order

# Sorting in descending order
sorted2 <- arrange(txt2, desc(psnu))
View(select(sorted2, psnu))
View(count(sorted2, psnu)) # doesn't obey the sort


# Sorting multiple variables
sorted3 <- arrange(txt2, psnu, indicator)
View(select(sorted3, psnu, indicator))
View(count(sorted3, psnu, indicator))

# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 2g Sort your dataset2 by ascending order for the following columns : operatingunit, psnu, snu1,
# Assign it the same name and View the dataset







#-------------------------------------------------------
# ---- Subsetting your data  ----- 
#--------------------------------------------------------


#---- Subsetting for Columns (select) -----#

# Use dplyr 'Select' function to subset by variable(s)
geo_df <- select(txt2, operatingunit, snu1, psnu, fiscal_year,cumulative)
names(geo_df)
View(geo_df)

# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:


#3a Subset dataset1 (from our first dataset) to include only the following variables:
# operatingunit, psnu, snu1, indicator, FY2018Q2 and name this new dataframe subset1





#---- Subsetting for Rows (filter) -----#

# filtering for one Indicator
hts <- filter(txt2, indicator =="HTS_TST")
# Ways to see if this worked
select(hts, indicator)
View (select(hts, indicator))
View (count(hts, indicator)) 


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 3b Subset the dataframe named subset1 to include only data for gp and name this new dataframe ou





# filter for one indicator, (uses logical operator Not Equal) 
hts2 <- filter(txt2, indicator != "HTS_TST")
View (select (hts2, indicator))
View (count(hts2, indicator)) 


# filter for multiple indicators, (uses logical operator OR) 
hts3 <- filter(txt2, indicator == "HTS_TST" | indicator == "TX_NEW")
View (select (hts3, indicator))
View (count(hts3, indicator)) 


# filter for multiple conditions, (uses logical operator AND) 
hts4 <- filter(txt2, indicator == "HTS_TST", cumulative > 100)
View (select (hts4, indicator, cumulative))
View (count(hts4, indicator, cumulative)) 


# filter for multiple conditions, (uses multiple operators and multiple conditions) 
# Filtering for HTS_TST and TX_NEW total numerator values and its psnus
hts5 <- filter(txt2, indicator == "HTS_TST" | indicator == "TX_NEW", standardizeddisaggregate == "Total Numerator", fiscal_year == "2019",cumulative > 100)
View (select (hts5, psnu, indicator, standardizeddisaggregate, cumulative))
View (count(hts5, psnu, indicator, standardizeddisaggregate, cumulative)) 


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 3c Subset the dataframe named ou to include only data for indicators:
# HTS_TST, HTS_TST_POS and standardized disaggregate = Total Numerator. Name this new dataframe "hts"









#-------------------------------------------------------
# ---- (7) Exporting your data ----- 
#--------------------------------------------------------


write_tsv(hts4, path = "Output/exported_data.txt")

write_csv(hts4, path = "Output/exported_data.csv")


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 4. Export your dataset, "hts"as a .txt file to the output folder in your R training folder. 
# Call it "exported2" in the path step










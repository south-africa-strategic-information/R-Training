

#___________________________________________________________________________
#
#         ___  2
#         |__) 
#         |  \    R Training 
#
#___________________________________________________________________________



# R Studio Projects -------------------------------------------------------
# R Studio projects are a great feature which allow you to have one dedicated session for each project you are working on
# One of the great features is that it sets the working directory to the project folder automatically so others can easily
# work off the same file without having to adjust their file paths (and everything is step up the exact same).
# To start an R Project that already exists, double click on the .Rproj file in the folder.
# If you have not opened this session via the .Rproj file, you will need to so that all the file paths work the same on your machine



# Every time you open R, you will need to "open" or load your packages, using library()
library(tidyverse)



#--------------------------------------------------------------
# ---- (1) Creating New Variables (Mutate) ----- 
#--------------------------------------------------------------

df <-  txt
# Dividing cumulative values by 10
df2 <- mutate(df, cum_true = cumulative/10)
View (select(df2, cumulative, cum_true))

# Above step AND doubling the FY18 Q2 values
df2 <- mutate(df, cum_true = cumulative/10, qtr2_true = qtr2 *2) 
View (select(df2, cumulative, cum_true, qtr2, qtr2_true))


# New Partner Names, one change
# mutate() and if_else() make for a powerful combination in tandem.
# if_else function is comprable to IF function in excel 

View(count(df, primepartner)) # view this variable
df3 <- mutate(df, newpartnername = 
                if_else(primepartner == "TBD", "NEW TBD", primepartner))
View(count(df3, primepartner, newpartnername))


# New Partner Names, multiple changes. 
df4 <- mutate(df, newpartnername = 
                if_else(primepartner == "TBD", "NEW TBD", 
                        if_else(primepartner == "THE AURUM INSTITUTE", "Aurum", 
                                 primepartner)))
View(count(df4, primepartner, newpartnername))


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 1. Create a new dataset called test1 from "df" and
# create a new variable called "newvar", which will change the funding agency value "HHS/CDC" to "CDC"
# 1a. Using count, view the psnu column in dataset test1 





#----------------------------------------------------------------------
# ---- (2) Piping %>%  - Bringing It All Together ----- 
#----------------------------------------------------------------------


# Pipes let you take the output of one function and send it directly to the next, 
# which is useful when you need to do many things to the same dataset

# %>% returns an object, you can actually allow the calls to be 
# chained together in a single statement, without needing variables 
# to store the intermediate results.



# Examples:
# Positives found by Total Numerator:
hts1 <- df %>%   # this is the pipe! goes at end of every function statement 
  filter(indicator == "HTS_TST_POS" & standardizeddisaggregate == "Total Numerator") %>%
  select (operatingunit, indicator, psnu, primepartner, fundingagency, standardizeddisaggregate, qtr1, cumulative)

View(slice(hts1, 1:20))


# Same example Without Piping:
# you have to create several intermediate datasets, which is inefficient 
hts_nopipe <- filter (df, indicator == "HTS_TST_POS" & standardizeddisaggregate == "Total Numerator")
hts_nopipe2 <- select(hts_nopipe, operatingunit, indicator, psnu, primepartner, fundingagency, standardizeddisaggregate, qtr1, cumulative)

View(slice(hts_nopipe2, 1:20))



# New on treatment by OU and disagg type
tx2 <- df %>%
  filter(indicator == "TX_NEW" & cumulative >0 ) %>%
  rename (disagg_type = standardizeddisaggregate ) %>% 
  select (operatingunit, indicator, psnu, disagg_type, cumulative)

View(count(tx2, operatingunit, indicator, psnu, disagg_type, cumulative))



tx3 <- df %>% 
  filter((indicator == "TX_CURR" | indicator == "TX_NEW" | indicator == "HTS_TST") & standardizeddisaggregate == "Total Numerator") %>%
  mutate (newpartnername = if_else(primepartner == "TB HIV CARE ASSOCIATION", "THC", primepartner)) %>% 
  select (operatingunit, snu1, snuprioritization, psnu, newpartnername, indicator, standardizeddisaggregate, cumulative) %>%
  arrange (newpartnername) %>%
  rename (disagg_type = standardizeddisaggregate) 

View(tx3)
View(count(tx3, newpartnername, indicator, disagg_type))


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 2. Please create a new dataset, "test2" from "df" where you pipe these steps together:
# filter for TX_NEW
# select operatingunit, psnu, FY2018Q2
# arrange psnu
# then View it



#----------------------------------------------------------------------
# ---- (3) Summarizing Data  ----- 
#----------------------------------------------------------------------

# now that we know about piping.....
# most of our work involves trying to aggregate or roll things up, similar to pivot tables
# let's try to look at our snu1 level of TX_NEW results from FY2017
# We can use the summarise commands to aggregate our data

df %>% 
  summarise(cumulative = sum(cumulative, na.rm = TRUE ))
# this give us a single line for the whole country and all indicators; let's filter
df %>% 
  filter(indicator == "TX_NEW", standardizeddisaggregate == "Total Numerator") %>% 
  summarise(cumulative = sum(cumulative, na.rm = TRUE ))
# that's better but we want to look at the APR results across SNUs, so we need to use a group_by command 
# (which should follow by ungroup so we don't perform any other calculations across this group)
df %>% 
  filter(indicator == "TX_NEW", standardizeddisaggregate == "Total Numerator") %>% 
  group_by(operatingunit, snu1) %>% 
  summarise(cumulative = sum(cumulative, na.rm = TRUE )) %>% 
  ungroup()  # it is important to ungroup after using group_by as R data objects retain the grouping internally
             # this will lead to errors if later you try to create a new variable




# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 3. create a new dataset, called test3 from df where you:
# filter for TX_CURR and Total Numerator 
# summarise cumulative 
# and group_by psnu
# then View it




#--------------------------------------------------------------
# ---- (4) Renaming Variables (Rename) ----- 
#--------------------------------------------------------------

View (slice(df, 1:20)) #seeing what is there currently

# like all R assignments, the new variable is on the left side of argument
df7 <- rename(df, Partner = primepartner, Agency = FundingAgency)

View(df7) # you will see new names in column headers

# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:

# 4. Please create a new dataset called test4 from df and rename snu1 to EssEnYouOne
# then view it 




#-------------------------------------------------------
# ---- (5) Cleaning your data ----- 
#--------------------------------------------------------
# Removing values with 'NA' 
# reading in the dataset with NA values in sex
na_df <- df

# Checking the data 
count(na_df, sex)


# Removing N/A or other undesireable values and convert to 
# True missing, or blank ""

na_df1 <- mutate(na_df, sex = if_else(sex == "N/A", "", sex))  #converts to blanks
count(na_df1, sex)

# when running models, true <NA> is treated as "missing"
# while blank "" is treated as another category for the variable
# Numeric variables will not accept "", but will have true <NA> only




#--------------------------------------------------------------
# ---- (6) Deleting Variables ----- 
#--------------------------------------------------------------

View (slice(df, 1:20))

# Let's remove UIDs
df8 <- select(df , -regionuid, -operatingunituid, -snu1uid, -psnuuid, -mech_code)

View (slice(df8, 1:20))


# ------- Exercise Question(s) -------------
# Please write and execute your code under the question:


# 5. Please create a new dataset, called test5 from df and delete RegionUID & operatingunitUID
# then view it




#----------------------------------------------------------------------
# ---- (7) Stacking Datasets  ----- 
#----------------------------------------------------------------------


         
# Use rbind function to stack or merge datasets by rows 

df_double <- bind_rows(df, na_df)


# If one dataset has variables that the other dataset does not, then bind_rows will
# Assigns "NA" to those rows of columns missing in one of the data frames 

df_double2 <- bind_rows(df8, na_df)
View(df_double2)













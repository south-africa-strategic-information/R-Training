###########################################
##    WORKING WITH LISTS EXAMPLE CODE    ##
###########################################

## NOTE: To run individual pieces of code 
## select the line of code and press ctrl + enter for Windows
## and command + enter for Macs

#==================================================================================

#### CREATING LISTS ####

# Lists are similar to vectors but can contain different data types
# Use function list()

# You can create a list this way

list.1 = list("Joe Smith", 23, TRUE) 
list.1
class(list.1)

# Or this way

j = c("Joe Smith", "Jane Johnson", "Dave Jones")
k = c(23, 27, 30)
l = c(TRUE, TRUE, FALSE)

list.2 = list(j, k, l)
list.2

# You can create named lists this way

list.3 = list("Names" = j, "Age" = k, "True" = l)
list.3

# Or with the names() function

names(list.2) = c("Names", "Age", "True")
list.2
# Get list information

length(list.3)            # length()
class(list.3)             # class()
names(list.3)             # names()
list.3[1:2]               # returns a list with the first two items 
list.3$Names              # $ lists the Names in the list
list.3[["Names"]]         # [[]] also pulls Names from the list
list.3[1]                 # first component in list.3
list.3[c(1,3)]            # first and third components in list.3
list.3[[3]][2]            # second component in the third element in list.3

#### Replacing list elements ####

list.3[[3]][2] = FALSE
list.3[[3]][2]

#### Adding a list element ####
# Note: R will add this element to the end of the list

list.3$Kids = c(2,3,1)
list.3

# You can remove the list element by setting it equal to NULL

list.3$Kids = NULL

# Or by putting a negative of the element you want to delete in square brackets

list.3[[3]][-1]

# Attach a list to R search path
# This allows you to search list elements without referencing the list

attach(list.3)
Names


# You can detach the list if you don't want it in the R search path.
# Make sure to do this when you're done searching so as to avoid errors.

detach(list.3)

# If we want to view a list as a data frame, we first need to separate all the items
# with the unlist() function

unlist(list.3)

# Then we use the as.data.frame() function

as.data.frame(list.3)

# Let's say we have multiple lists with vectors that represent 
# the same categories and we want to combine them into a data frame.

Dogs = list("Names" = c("Jack", "Liz", "Jenna"), 
            "Breed" = c("King Charles", "Mutt", "Poodle"), 
            "Ages" = c(17, 12, 4))
Cats = list("Names" = c("Homer", "Marge", "Lisa"), 
            "Breed" = c("Tabby", "Calico", "Tuxedo"), 
            "Ages" = c(12, 11, 3))

# First, we need to create columns for each category with 
# the cbind function

Dogs.1 = cbind("Dogs", Dogs$Names, Dogs$Breed, Dogs$Ages)
View(Dogs.1)
class(Dogs.1)
Dogs.1 = as.data.frame(Dogs.1)

Cats.1 = cbind("Cats", Cats$Names, Cats$Breed, Cats$Ages)
Cats.1 = as.data.frame(Cats.1)
class(Cats.1)
View(Cats.1)

# Then we bind the two data sets by row

Cats.Dogs = rbind(Dogs.1, Cats.1)
View(Cats.Dogs)

# Now we have a data frame that contains all the information from the 
# lists. We can also rename the columns to match the categories

colnames(Cats.Dogs) = c("Animal Type", "Name", "Breed", "Age")

# RITHMETIC  ZL ULZTION
2+3

#asigning variable
x <- 3
x = 3
x
y <- 4
y

#Plotting in R
x <- c(1,2,3)
y <- c(3,4,1)
plot(x,y)

#class of variables
class(x)
length(x)
class(y)
length(y)

#strings
str <- ("this is my first script")
class(str)
length(str)

("this is my first script") -> str
str

# clear your variables
ls() 
rm(list=ls())

# Functions
?mean
?sd
?max

# creating a function
# name of function
# function statement
# some argument
# body
# return statement (#optional)

my_sum <- function(input_1,input_2) {
  tot = input_1 + input_2
  return(tot)
}

# Assigning Values
input_1 = 3
input_2 = 4
input_1 + input_2
my_sum(input_1,input_2)

# Calling a function
my_sum(input_1=2,input_2=4)
my_sum(input_1=4,input_2=5)
my_sum(input_1,input_2)

# native function
sum(input_1,input_2)

# converting fahrenheit ot Kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp-32)*(5/9)) + 273.15
  return(kelvin)
}

fah_to_kelvin(temp=32)
fah_to_kelvin(32)

# converting Kelvin to Celsius
kel_to_cel <- function(temp) {
  celsius <- temp-273.15
  return(celsius)
}

kel_to_cel(0)


#Excercise
# Write a function to convert "fah_to_celsius"
fah_to_celsius <- function(temp){
  celsius = (temp-32)*5/9
  return(celsius)
}

fah_to_celsius(32)
fah_to_celsius(110)
fah_to_celsius(80)

fah_to_celsius_2 <- function(temp){
  temp_k <- fah_to_kelvin(temp)
  result <- kel_to_cel(temp_k)
  return(result)
}

fah_to_celsius_2(temp=110)


# Exercise @
best_practice <- c("write", "programs", "for", "people", "not", "computers")
asterix <- "***"

#call a function called fence that takes two arguments
#and a new vector somenting like asterix at the beginning and at the end
#Expected output
# "***", "write", "programs", "for", "people", "not", "computers" "***"

fence = function(string_1, string_2){
  result = c(string_2, string_1, string_2)
  return(result)
}

string_1 = c("write", "programs", "for", "people", "not", "computers")
string_2 = ("***")

fence(string_1,string_2)

#REmove kel_to_cel function from environment
rm(kel_to_cel)
ls()   #check that functionis removed

#run kel_to_cel from temp_convert_fcts.R which is saved in hte working directory (source
# if the function is in a subdirectory of the source directory then use source("foldername/temp_convert_fcts.R")
source("temp_convert_fcts.R")
kel_to_cel(0)

# now doing something with real data set
dir.create("data")  #create a directory
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder.csv")

dat <- read.csv("data/gapminder.csv", header=TRUE)
head(dat)
summary(dat)   # prints out statistical info on the columns
str(dat)       #

# Write a function that displays the min, max and and mean of life expectancynof that country
# subsetting df

country_name <- subset(dat, dat$country == "Uganda")
head(country_name)
summary(country_name)
# Calculate mean min, and max
mean(country_name[,5])   #here you call life expectancy by column number
min(country_name$lifeExp)  # call by column header
max(country_name$lifeExp)

# Function now
analyze <- function(cntr){
  country_name <- subset(dat, dat$country == cntr)
  print(mean(country_name[,5]))
  print(min(country_name[,5]))
  print(max(country_name[,5]))
}

analyze("Uganda")

# Function alternative; can not use "country" as a variable, since that already exists
analyze <- function(cntr){
  country_name <- subset(dat, dat$country == cntr)
  print(mean(country_name$lifeExp))
  print(min(country_name$lifeExp))
  print(max(country_name$lifeExp))
}

analyze("Uganda")
analyze ("Albania")

# Modify the analyze function to generate a plot with "year" on x-axis 
# and "lifeExp" pn y-axis

# Function alternative; can not use "country" as a variable, since that already exists
analyze_plot <- function(cntr){
  country_name <- subset(dat, dat$country == cntr)
  print(mean(country_name$lifeExp))
  print(min(country_name$lifeExp))
  print(max(country_name$lifeExp))
  out <- c("Mean_LE" = mean(country_name$lifeExp), "Min_LE" = min(country_name$lifeExp), "Max_LE" =max(country_name$lifeExp))
  plot(x=country_name$year, y=country_name$lifeExp, xlab="Year", ylab="Life Expectancy", main=cntr)
  print(out)
}

analyze_plot("Albania")
analyze_plot("Uganda")
analyze_plot("Germany")
analyze_plot("Denmark")
analyze_plot("Austria")
analyze_plot("Mexico")
analyze_plot("Japan")

# Function that can import more than one argument
best_practice = c("write", "programs", "for", "people", "not", "computers")

best_practice_fun <- function(some_argument){
  print(some_argument[1])
  print(some_argument[2])
  print(some_argument[3])
  print(some_argument[4])
  print(some_argument[5])
  print(some_argument[6])
}

best_practice_fun(best_practice)

for (w in best_practice){
  print(w)
}

best_practice_fun2 <-function(some_argument){
  for (w in some_argument){   # w exists only inside the for-loop and is sequnetially assigned to each variable insome_argument 
    print(w)
  }
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" and name it as gapminder_52_97
#and another file that contians years "1967" and "2007" and name it as gapminder_66_07

gapminder_52_97 <- subset(dat, dat$year == 1952 | dat$year == 1997)     #| is the logical or
head(gapminder_52_97)

gapminder_67_07 <- subset(dat, dat$year == 1967 | dat$year == 2007)
head(gapminder_67_07)
                     
# writing a dataset into a particular folder
write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07)

#the above command will include the linenumber on each row and it includes quotes 
write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)


# Listing the files with a patern in a directory
list.files(path = "data", pattern = ".csv", full.names = TRUE)

# write a for loop to print each filename on a diferent line 
# for the above output
file_names <- list.files(path = "data", pattern = ".csv", full.names = TRUE)
for(f in file_names){
  print(f)
}

# Using the function you wrote this morning to print out the results 
#from multiple data sets
# Function alternative; can not use "country" as a variable, since that already exists

analyze_all <- function(countries){
  for(w in countries){
  country_name <- subset(dat, dat$country == w)
  print(mean(country_name$lifeExp))
  print(min(country_name$lifeExp))
  print(max(country_name$lifeExp))
  out <- c("country" = w, "Mean_LE" = mean(country_name$lifeExp), "Min_LE" = min(country_name$lifeExp), "Max_LE" =max(country_name$lifeExp))
  plot(x=country_name$year, y=country_name$lifeExp, xlab = "Year", ylab = "Life Expectancy", main=w)
  print(out)
  }
}

countries <- c("Albania", "Uganda", "Germany")
analyze_all(countries)



# This is what the instructor did, but not working for me
analyze_data <- function(file, new) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country == new)
  out2 <- c("Mean_le" = mean(country_name$lifeExp), 
            "Min_le" = min(country_name$lifeExp), 
            "Max_le" = max(country_name$lifeExp))
  print(file)
  print(new)
  print(out2)
  plot(country_name$year, country_name$lifeExp, xlab="Year", ylab="Life Expectancy", 
       main=new) 
}

analyze_data("data/gapminder.csv", "Uganda")

analyze_all <- function(pattern, new) {
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze_data(f,new )
  }
}

analyze_all(".csv", "Uganda")

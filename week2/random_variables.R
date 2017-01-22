## Random Variable Exercises

# Setup
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Q1 What is the average of these weights?
mx <- mean(x)

# Q2 After setting the seed at 1, set.seed(1) take a random sample of size 5. What is the absolute value (use abs)
# of the difference between the average of the sample and the average of all the values?
set.seed(1); ms <- mean(sample(x,5))
abs(mx - ms)

# Q3 After setting the seed at 5, set.seed(5) take a random sample of size 5. What is the absolute value of the
# difference between the average of the sample and the average of all the values?
set.seed(5); ms2 <- mean(sample(x,5))
abs(mx - ms2)

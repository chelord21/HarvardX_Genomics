## Population, sample and estimates exercises
# Setup
library(downloader)
library(dplyr)
library(rafalib)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 
dat <- na.omit( dat )

# Q1 Use dplyr to create a vector x with the body weight of all males on the control (chow) diet.
# What is this population's average?
x <- unlist(select(filter(dat, Diet == "chow" & Sex == "M"), Bodyweight))
mx <- mean(x)

# Q2 Now use the rafalib package and use the popsd function to compute the population standard deviation.
popsd(x)

# Q3 Set the seed at 1. Take a random sample X of size 25 from x. What is the sample average?
set.seed(1)
sx <- sample(x, 25)
msx <- mean(sx)

# Q4 Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet.
# What is this population's average?
y <- unlist(select(filter(dat, Diet == "hf" & Sex == "M"), Bodyweight))
my <- mean(y)

# Q5 Now use the rafalib package and use the popsd function to compute the population standard deviation.
popsd(y)

# Q6 Set the seed at 1. Take a random sample Y of size 25 from y. What is the sample average?
set.seed(1)
sy <- sample(y, 25)
msy <- mean(sy)

# Q7 What is the difference in absolute value between y−x and Y−X?
abs((my - mx) - (msy - msx))

# Q8 Repeat the above for females. Make sure to set the seed to 1 before each sample call.
# What is the difference in absolute value between y−x and X−Y?
fx <- unlist(select(filter(dat, Diet == "chow" & Sex == "F"), Bodyweight))
mfx <- mean(fx)
set.seed(1)
fsx <- sample(fx, 25)
mfsx <- mean(fsx)

fy <- unlist(select(filter(dat, Diet == "hf" & Sex == "F"), Bodyweight))
mfy <- mean(fy)
set.seed(1)
fsy <- sample(fy, 25)
mfsy <- mean(fsy)

abs((mfy - mfx) - (mfsy - mfsx))

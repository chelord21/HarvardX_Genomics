## Normal Distribution Exercises
# Setup
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

## Using the same process as before (in Null Distribution Exercises), set the seed at 1, then using a for-loop
# take a random sample of 5 mice 1,000 times. Save these averages. After that, set the seed at 1, then using a
# for-loop take a random sample of 50 mice 1,000 times. Save these averages.
small_sample <- vector("numeric", 1000)
big_sample <- vector("numeric", 1000)
set.seed(1)
for(i in 1:1000){
  small_sample[i] <- mean(sample(x, 5))
  big_sample[i] <- mean(sample(x, 50))
}

# Q1 Use a histogram to "look" at the distribution of averages we get with a sample size of 5 and a sample size
# of 50. How would you say they differ?
# Answer: They both look roughly normal, but with a sample size of 50 the spread is smaller.

# Q2 For the last set of averages, the ones obtained from a sample size of 50, what proportion are between 23 and 25?
mean(big_sample < 25 & big_sample > 23)

# Q3 Now ask the same question of a normal distribution with average 23.9 and standard deviation 0.43.
(pnorm(25, mean = 23.9, sd = 0.43) - pnorm(23, mean = 23.9, sd = 0.43))
## Null Distribution Exercises
# Setup

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )

# Q1 Set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times. 
# Save these averages. What proportion of these 1,000 averages are more than 1 gram away from the average of x ?

set.seed(1)
for(i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)  
}
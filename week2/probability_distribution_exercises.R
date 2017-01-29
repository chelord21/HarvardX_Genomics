## Probability Distribution Exercises
# Setup
library(dplyr)
library(gapminder)
data(gapminder)

# Q1 What is the proportion of countries in 1952 that have a life expectancy less than or equal to 40?
a1 <- mean(select(filter(gapminder, year==1952), lifeExp) <= 40)

# Q2 What is the proportion of countries in 1952 that have a life expectancy between 40 and 60 years? 
mean(select(filter(gapminder, year==1952), lifeExp) <= 60) - a1

## Sapply on a custom function
x <- select(filter(gapminder, year==1952), lifeExp)
prop = function(q){
  mean(x <= q)
}
prop(40)
qs = seq(from=min(x), to=max(x), length=20)

props = sapply(qs, prop)
plot(qs, props) # vs plot(ecdf(unlist(x)))
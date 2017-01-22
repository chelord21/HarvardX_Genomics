library(dplyr)
dat <- read.csv("femaleMiceWeights.csv")

# Mice with diet chow
control <- filter(dat, Diet =='chow') %>%
    select(Bodyweight) %>% unlist

# Mice with high fat diet
treatment <- filter(dat, Diet =='hf') %>%
  select(Bodyweight) %>% unlist

obs <- mean(treatment) - mean(control)

# Import the weights of all female mice
population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

# Being skeptic, assume Null Hypothesis is true, so there is no difference
# Se asigna una muestra "igual" o de lo mismo al cabo "No hay diferencia", suponiendo
# que la hipótesis nula es verdadera
n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)  
}

# How often the null value is bigger than the observation
mean(nulls > obs)
mean(abs(nulls) > obs)

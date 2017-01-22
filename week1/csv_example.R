# Getting Started Exercises
dat <- read.csv("femaleMiceWeights.csv")

# Q1 
names(dat)[2]

# Q2
dat[12, 2]

# Q3
dat$Bodyweight[11]

# Q4
length(dat$Bodyweight)

# Q5
logical_index = dat$Diet == 'hf'
mean(dat[logical_index,]$Bodyweight)

# Q6
set.seed(1); sample(dat$Bodyweight[13:24],1)
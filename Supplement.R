library(tidyverse)
library(data.table)

# This is the URL for the data that will be analyzed.
urlfile <- "https://raw.githubusercontent.com/Mike-8888/IS4300-Final-Project/main/Guns.csv"

# Read the data into R and name it G.
G <- read_csv(url(urlfile))

# Convert data set to a data frame
G <- as.data.frame(G)

# Find out when (earliest year) each state enacted the shall carry law
G <- G %>% filter(law=="yes") %>% select(state, year)
setDT(G)[, .SD[which.min(year)], by = state]

# There are 29 states enacted the shall carry law and the average time is the
# year of 1995
mean(G$year[1:29])

# Use a histogram to show how many states have enacted the law in each period
year <- G$year[1:29]
hist(year)

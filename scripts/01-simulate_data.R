#### Preamble ####
# Purpose: Simulates a dataset representing monthly consumer bankruptcies  
# in Toronto with relevant attributes.
# Author: Marzia Zaidi
# Date: 26 November 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(123)

# Create a simulated dataset for consumer bankruptcies
consumer_bankruptcies <- data.frame(
  month_id = 1:200, # Unique identifier for each month of data
  year = rep(2008:2024, each = 12, length.out = 200), # Year (2008 to 2024)
  month = rep(1:12, times = 17)[1:200], # Month (1 to 12)
  measure_value = round(rpois(200, lambda = 5000) * 
                          (1 - 0.05 * (2008:2024 - 2008)[rep(1:17, each = 12)][1:200]) * 
                          (1 + sin(2 * pi * (1:12) / 12)[rep(1:12, times = 17)[1:200]]), 0), # Simulated bankruptcies with seasonal and yearly trends
  budget_variance = round(rnorm(200, mean = 0, sd = 0.1), 2), # Normal distribution for budget variance
  unemployment_rate = round(rnorm(200, mean = 6.5, sd = 1), 1), # Normal distribution for unemployment rate
  interest_rate = round(rnorm(200, mean = 3.5, sd = 0.5), 1), # Normal distribution for interest rate
  major_economic_event = sample(c("None", "Recession", "Policy Change"), 200, replace = TRUE, prob = c(0.7, 0.2, 0.1)) # Economic events
)

# Adjust bankruptcies based on major economic events
consumer_bankruptcies$measure_value <- ifelse(
  consumer_bankruptcies$major_economic_event == "Recession",
  consumer_bankruptcies$measure_value * 1.2,
  consumer_bankruptcies$measure_value
)

consumer_bankruptcies$measure_value <- ifelse(
  consumer_bankruptcies$major_economic_event == "Policy Change",
  consumer_bankruptcies$measure_value * 0.9,
  consumer_bankruptcies$measure_value
)

# Check the dataset
head(consumer_bankruptcies)

#### Save data ####
write_csv(consumer_bankruptcies, "data/simulated_data/consumer_bankruptcies_simulated_data.csv")

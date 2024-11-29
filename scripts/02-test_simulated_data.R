#### Preamble ####
# Purpose: Tests the structure and validity of the simulated consumer bankruptcies dataset.
# Author: Marzia Zaidi
# Date: 26 November 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT
# Pre-requisites: 
# - The tidyverse package must be installed and loaded.
# - The consumer bankruptcy data must have been simulated and saved to csv.

#### Workspace setup ####
library(tidyverse)

# Load the simulated data
file_path <- "data/simulated_data/consumer_bankruptcies_simulated_data.csv"
if (file.exists(file_path)) {
  consumer_bankruptcies <- read_csv(file_path)
  message("Test Passed: The file was located and the dataset loaded from the file.")
} else {
  stop("Test Failed: The file does not exist at the specified path.")
}


#### Test data ####

# Check the number of rows
if (nrow(consumer_bankruptcies) == 200) {
  message("Test Passed: The dataset has 200 rows.")
} else {
  stop("Test Failed: The dataset does not have 200 rows.")
}

# Check the number of columns
if (ncol(consumer_bankruptcies) == 8) {
  message("Test Passed: The dataset has correct number of columns.")
} else {
  stop("Test Failed: The dataset does not have the correct number of columns.")
}

# Check if year values are within the range of 2008 to 2024
if (all(consumer_bankruptcies$year >= 2008 & consumer_bankruptcies$year <= 2024)) {
  message("Test Passed: The 'year' column values are within the range of 2008 to 2024.")
} else {
  stop("Test Failed: The 'year' column contains values outside the range of 2008 to 2024.")
}

# Check if month values are integers between 1 and 12
if (all(consumer_bankruptcies$month >= 1 & consumer_bankruptcies$month <= 12 & consumer_bankruptcies$month %% 1 == 0)) {
  message("Test Passed: The 'month' column contains valid integer values between 1 and 12.")
} else {
  stop("Test Failed: The 'month' column contains invalid values.")
}

# Check if measure_value values are non-negative integers
if (all(consumer_bankruptcies$measure_value >= 0 & consumer_bankruptcies$measure_value %% 1 == 0)) {
  message("Test Passed: The 'measure_value' column contains non-negative integers.")
} else {
  stop("Test Failed: The 'measure_value' column contains invalid values.")
}

# Check if budget_variance values are numeric and within a reasonable range
if (all(is.numeric(consumer_bankruptcies$budget_variance) & consumer_bankruptcies$budget_variance >= -1 & consumer_bankruptcies$budget_variance <= 1)) {
  message("Test Passed: The 'budget_variance' column contains numeric values within the range of -1 to 1.")
} else {
  stop("Test Failed: The 'budget_variance' column contains values outside the range of -1 to 1.")
}

# Check if `major_economic_event` contains only expected categories
valid_events <- c("None", "Recession", "Policy Change")
if (all(consumer_bankruptcies$major_economic_event %in% valid_events)) {
  message("Test Passed: The 'major_economic_event' column contains only valid categories.")
} else {
  stop("Test Failed: The 'major_economic_event' column contains invalid categories.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(consumer_bankruptcies))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

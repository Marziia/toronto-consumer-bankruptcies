#### Preamble ####
# Purpose: Tests the structure and validity of the cleaned consumer bankruptcies dataset.
# Author: Marzia Zaidi
# Date: 26 November 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT
# Pre-requisites: 
# - The tidyverse package must be installed and loaded.
# - The consumer bankruptcy data must have been cleaned and saved down to csv.

#### Workspace setup ####
library(tidyverse)

# Load the cleaned data
file_path <- "data/analysis_data/consumer_bankruptcies_cleaned.csv"
if (file.exists(file_path)) {
  consumer_bankruptcies <- read_csv(file_path)
  message("Test Passed: The file was located and the dataset loaded from the file.")
} else {
  stop("Test Failed: The file does not exist at the specified path.")
}


#### Test data ####

# Check for correct number of columns
expected_columns <- c("measure_value", "budget_variance", "year", "period_number_in_year")
if (all(expected_columns %in% colnames(bankruptcies_data_cleaned))) {
  message("Test Passed: The cleaned dataset contains all expected columns.")
} else {
  stop("Test Failed: The cleaned dataset is missing some expected columns.")
}

# Check if measure_value is non-negative
if (all(bankruptcies_data_cleaned$measure_value >= 0)) {
  message("Test Passed: The 'measure_value' column contains non-negative values.")
} else {
  stop("Test Failed: The 'measure_value' column contains negative values.")
}

# Check if budget_variance is within a reasonable range
if (all(bankruptcies_data_cleaned$budget_variance >= -1 & bankruptcies_data_cleaned$budget_variance <= 1)) {
  message("Test Passed: The 'budget_variance' column contains values within the range of -1 to 1.")
} else {
  stop("Test Failed: The 'budget_variance' column contains out-of-range values.")
}

# Check if year values fall within 2008-2024
if (all(as.numeric(as.character(bankruptcies_data_cleaned$year)) >= 2008 &
        as.numeric(as.character(bankruptcies_data_cleaned$year)) <= 2024)) {
  message("Test Passed: The 'year' column values are within the range of 2008 to 2024.")
} else {
  stop("Test Failed: The 'year' column contains out-of-range values.")
}

# Check if period_number_in_year is between 1 and 12
if (all(as.numeric(as.character(bankruptcies_data_cleaned$period_number_in_year)) >= 1 &
        as.numeric(as.character(bankruptcies_data_cleaned$period_number_in_year)) <= 12)) {
  message("Test Passed: The 'period_number_in_year' column contains valid values (1-12).")
} else {
  stop("Test Failed: The 'period_number_in_year' column contains invalid values.")
}

# Check for missing values in cleaned data
if (all(!is.na(bankruptcies_data_cleaned))) {
  message("Test Passed: The cleaned dataset contains no missing values.")
} else {
  stop("Test Failed: The cleaned dataset contains missing values.")
}


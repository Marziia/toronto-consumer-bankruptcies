#### Preamble ####
# Purpose: Cleans and validates the consumer bankruptcies dataset for GLM analysis
# Author: Marzia Zaidi
# Date: 26 November 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(gt)
library(arrow)

#### Load data ####
# Define the file path for raw data
file_path <- "data/raw_data/raw_data.csv"

# Check if the file exists and load the data
if (file.exists(file_path)) {
  bankruptcies_data <- read_csv(file_path)
  message("Test Passed: The dataset was successfully loaded from the file.")
} else {
  stop("Test Failed: The file does not exist at the specified path.")
}

#### Clean data ####
# Select relevant columns and handle missing values
bankruptcies_data_cleaned <- bankruptcies_data %>%
  select(measure_name,measure_value, year, period_number_in_year) %>%
  filter(
    measure_name == "Number of Consumer Bankruptcies for the City of Toronto" & 
    !is.na(measure_value) & 
      !is.na(year) & 
      !is.na(period_number_in_year)
  )

# Convert `year` and `period_number_in_year` to categorical if necessary
bankruptcies_data_cleaned <- bankruptcies_data_cleaned %>%
  mutate(
    year = as.factor(year),
    period_number_in_year = as.factor(period_number_in_year)
  )

#### Display cleaned data ####
bankruptcies_data_cleaned %>%
  head() %>%
  gt() %>%
  tab_header(
    title = "Cleaned Consumer Bankruptcy Data",
    subtitle = "Displaying a few rows of the cleaned data"
  )

#### Save cleaned data ####
write_csv(bankruptcies_data_cleaned, "data/analysis_data/consumer_bankruptcies_cleaned.csv")
write_parquet(bankruptcies_data_cleaned, "data/analysis_data/consumer_bankruptcies_cleaned.parquet")

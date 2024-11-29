#### Preamble ####
# Purpose: Download and save Toronto Dashboard Data to analyze 
# consumer bankruptcies from 2008 to 2024 from Open Data Toronto
# Author: Marzia Zaidi
# Date: 26 November 2024
# Contact: marzia.zaidi@utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Setting Up the Workspace ####

library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Downloading the Data #### 
package_id <- "c6d64e9b-f85a-4084-be14-60cf18509203"

package <- show_package(package_id)

resources <- list_package_resources(package_id)

datastore_resources <- filter(resources, tolower(format) %in% c('xlsx', 'csv'))

downloaded_data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()

downloaded_data

#### Create a Dataframe with the Downloaded Data ####

write.csv(downloaded_data, file = "data/raw_data/raw_data.csv")


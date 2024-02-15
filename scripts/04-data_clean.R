#### Preamble ####
# Purpose: Cleaning data on survey results prior to analysis. Data frame is reduced (unneeded columns, waves), columns are renamed for clarity and consistency.
# Author: Pengyu Sui
# Contact: pengyu.sui@mail.utoronto.ca
# License: MIT
# Pre-requisites: download data

library(haven)
library(dplyr)
library(ggplot2)

# download data
survey_data <- read_dta("inputs/data/survey.dta")
median_value <- median(survey_data$hate_violence_means, na.rm = TRUE)
survey_data <- survey_data %>%
mutate(hate_crime_occurred = as.factor(ifelse(hate_violence_means > median_value, 1, 0)))

# Check converted variables
table(survey_data$hate_crime_occurred)
survey_data <- survey_data %>%
  
# Ensure that the gender imbalance is a numeric value
mutate(
    gender = as.factor(gender),
    marital = as.factor(marital),
    pop_15_44_muni_gendergap_2015 = as.numeric(pop_15_44_muni_gendergap_2015) # Ensure that the gender imbalance is a numeric value
                     )

# Confirm structure and data type
str(survey_data)
                   
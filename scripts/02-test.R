#### Preamble ####
# Purpose: develop tests for simulation.
# Author: Pengyu Sui
# Contact: pengyu.sui@mail.utoronto.ca
# License: MIT
# Pre-requisites: read 01-simulation.R

# read file
survey_sim <- read.csv("scripts/01-simulation.R") 

# Test for gender distribution
all(survey_sim$gender %in% c(1, 2)) # Assuming 1 for male and 2 for female

# Test for education level categories
all(survey_sim$education %in% c("High School", "Bachelor's", "Master's", "PhD"))

# Assuming age_group is a factor indicating different age categories
# Test for age group consistency
all(survey_sim$age_group %in% c("18-29", "30-39", "40-49", "50-59", "60+"))

# Test for marital status categories
all(survey_sim$marital %in% c("Single", "Married", "Divorced", "Widowed"))


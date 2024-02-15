#### Preamble ####
# Purpose: download dataset.
# Author: Pengyu Sui
# Contact: pengyu.sui@mail.utoronto.ca
# License: MIT
# Pre-requisites: -

#loading packages
library(readstata13)
library(readr)

#reading in the stata file
survey <- read.dta13(here::here("inputs/data/survey.dta"))

#writing to csv
write_csv(survey, here::here("inputs/data/survey.csv"))
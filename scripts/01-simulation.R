#### Preamble ####
# Purpose: Simulating data on survery results.
# Author: Pengyu Sui
# Contact: pengyu.sui@mail.utoronto.ca
# License: MIT
# Pre-requisites: -

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Simulate survey data
n <- 1000  # Sample size
gender_ratio <- runif(n, min=0.8, max=1.2)  # Simulate gender imbalance
age <- sample(18:65, n, replace = TRUE)  # Simulate age
education <- sample(1:3, n, replace = TRUE, prob = c(0.3, 0.5, 0.2))  # Simulate education levels
hate_crime <- ifelse(gender_ratio > 1 & runif(n) < (gender_ratio - 1) * 0.5, 1, 0)  # Simulate hate crime occurrence
data <- data.frame(gender_ratio, age, education, hate_crime)

# Analyze data with logistic regression
model <- glm(hate_crime ~ gender_ratio + age + education, data = data, family = "binomial")

# Visualize results
ggplot(data, aes(x = gender_ratio, y = hate_crime)) +
  geom_jitter(alpha = 0.2) +
  geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE, color = "blue") +
  labs(x = "Gender Ratio (Male to Female)", y = "Probability of Hate Crime Occurrence") +
  theme_minimal()

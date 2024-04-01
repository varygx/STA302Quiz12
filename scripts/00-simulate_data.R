#### Preamble ####
# Purpose: Simulates a cancer dataset and graphs it
# Author: Allen Uy
# Date: 1 April 2024
# Contact: allen.uy@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(42)

sim_data <- tibble(
  gender = sample(c("Male", "Female"), 10, replace = TRUE),
  age = sample(18:80, 10, replace = TRUE),
  type = sample(c("Prostate", "Breast", "Kidney"), 10, replace = TRUE),
  status = sample(c("Alive", "Dead"), 10, replace = TRUE)
)

write_csv(sim_data, "data/sim_data.csv")

ggplot(sim_data, aes(x = type, fill = status)) +
  geom_bar() +
  labs(title = "Occurrences of Deaths by Type, by Gender",
       x = "Type",
       y = "Count") +
  facet_wrap(~ gender) +
  theme_minimal()

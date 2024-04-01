#### Preamble ####
# Purpose: Models cancer deaths using the simulated dataset
# Author: Allen Uy
# Date: 1 April 2024
# Contact: allen.uy@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R is run and sim_data.csv exists


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(here)


#### Read data ####
sim_data <- read_csv(here::here("data/sim_data.csv"))

sim_data$status = as.factor(sim_data$status)
sim_data$gender = as.factor(sim_data$gender)
sim_data$type = as.factor(sim_data$type)

### Model data ####
cancer_model <-
  stan_glm(
    formula = status ~ gender + age + type,
    data = sim_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 42
  )

#### Save model ####
saveRDS(
  poll_model,
  file = "models/cancer_model.rds"
)

summary(cancer_model)



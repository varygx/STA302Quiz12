#### Preamble ####
# Purpose: Tests the simulated dataset
# Author: Allen Uy
# Date: 1 April 2024
# Contact: allen.uy@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-simulate_data.R is run and sim_data.csv exists


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(here)
sim_data <- read_csv(here::here("data/sim_data.csv"))

#### Test data ####
test_that("variables are not null", {
  expect_false(any(is.null(sim_data$gender)), "Gender variable contains null values")
  expect_false(any(is.null(sim_data$age)), "Age variable contains null values")
  expect_false(any(is.null(sim_data$type)), "Type variable contains null values")
  expect_false(any(is.null(sim_data$status)), "Status variable contains null values")
})

test_that("variables are correct type", {
  expect_type(sim_data$age, "double")
  expect_type(sim_data$gender, "character")
  expect_type(sim_data$status, "character")
  expect_type(sim_data$type, "character")
})

test_that("all ages are non-negative", {
  expect(all(sim_data$age >= 0), "Some ages are negative")
})

test_that("categorical variables are within domain", {
  expect(all(sim_data$gender %in% c("Male", "Female")), "Gender variable contains values outside of the domain")
  expect(all(sim_data$type %in% c("Kidney", "Breast", "Prostate")), "Type variable contains values outside of the domain")
  expect(all(sim_data$status %in% c("Alive", "Dead")), "Status variable contains values outside of the domain")
})

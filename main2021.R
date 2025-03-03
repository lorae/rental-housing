# This script is meant to read in and perform basic analytics on the 2021 RHFS data.

library(dplyr)
library(glue)

# Read in RHFS and do some exploratory analysis

rhfs <- read.csv("data/rhfspuf2021_v1_1.csv")

# MORTAMT_R: Amount of original loan - 1st debt, recoded. All properties in scope 
# where NUMCAT_R = '02', '03', or '04' (which indicates that there are 5 + units
# in the property)
rhfs |> count(MORTAMT_R, name = "Count")
# Lots are missing. Is it because of NUMCAT_R?
rhfs |> count(NUMCAT_R, name = "Count")
# All NUMCAT_R <= 1 or >4 (there actually are no cases >4) are counted as MORTAMT == -8
rhfs |> filter(NUMCAT_R <= 1 | NUMCAT_R > 4) |> count(MORTAMT_R, name = "Count")

# Define a function to quickly summarize how much missing data there is
count_missing <- function(table, colname) {
  n_obs <- table |> pull(Count) |> sum()
  n_missing <- table |> filter(!!sym(colname) == -9) |> pull(Count) |> sum()
  p_missing <- ((n_missing / n_obs) * 100) |> round(2)
  n_na <- table |> filter(!!sym(colname) == -8) |> pull(Count) |> sum()
  p_na <- ((n_na / n_obs) * 100) |> round(2)
  p_other <- (((n_obs - n_missing - n_na) / n_obs) * 100) |> round(2)

  
  print(glue(
    "There are {n_obs} observations. Of them, 
    {n_missing} or {p_missing}% are missing and 
    {n_na} or {p_na}% are not applicable. 
    {p_other}% of the observations fall in other categories."
    ))
}

# How many MORTAMT_R entries are missing? Quite a bit. 58% did not answer.
count_missing(rhfs |> count(MORTAMT_R, name = "Count"), "MORTAMT_R")

# How many MORTAMT_R entries are missing? Quite a bit. 58% did not answer.
count_missing(rhfs |> count(YRPROPACQ_R, name = "Count"), "YRPROPACQ_R")
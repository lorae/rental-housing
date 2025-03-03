# This script is meant to read in and perform basic analytics on the 2012 RHFS data.

library(dplyr)

# ----- Step 1: Load in data ----- #
# For documentation on each of these 5 files, please see page 4 of the codebook
# https://www.census.gov/programs-surveys/rhfs/data/puf/2012/2012-codebook.html

# A list of the encodings of all values 
catvar <- read.csv("data/2012/catvar.csv")

# These are the properties that were successfully interviewed. N = 2260
interviewprops <- read.csv("data/2012/interviewprops.csv")

# These are the properties that were not successfully interviewed. N = 1770
# TODO: Evaluate reasons data are missing in-depth.
nonintprops <- read.csv("data/2012/nonintprops.csv")

# Replicate weights for standard error calculations. Non-interview rows = 0. N = 4030
repwgt <- read.csv("data/2012/repwgt.csv")

# Sample design information for each record. N = 4030
sample_design <- read.csv("data/2012/sample_design.csv")

#
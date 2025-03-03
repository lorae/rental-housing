# This script is meant to read in and perform basic analytics on the 2015 RHFS data.

library(dplyr)

# ----- Step 1: Load in data ----- #
# For documentation, please see the codebook, which is available online and also
# in the `data/2015` directory

# A list of the encodings of all values 
rhfs2015 <- read.csv("data/2015/rhfspuf2015final_011222.csv")

# ----- Step 2: Data quality checks on outcomes ----- #
# The data only contains entries where OUTCOME == 501 (Successful, complete interview)
rhfs2015 |> count(OUTCOME, name = "Count")
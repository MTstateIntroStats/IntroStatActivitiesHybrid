# Take random sample of 500 boxers
handedness <- read.csv("data/Male_boxers.csv") # Read in data set
set.seed(12980) # Set random number generator to select 
# same sample each time.
# Remove this line to get a different random sample.
handedness_sub <- handedness %>%
    select(Stance) %>% # Select Stance variable
    sample_n(500, replace=FALSE) # Randomly sample 500 rows
dim(handedness_sub) # Check dimensions of data set are 500 rows x 1 col

write.csv(handedness_sub, "data/Male_boxers_sample.csv", row.names=FALSE)

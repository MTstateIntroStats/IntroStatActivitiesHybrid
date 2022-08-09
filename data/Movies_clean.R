## Clean Movies2016_Full.csv data set for use in class

movies <- read.csv("data/Movies_Full.csv", na.strings = c(""," ",NA))

# Filter to year 2016
movies <- movies %>%
    filter(title_year == 2016)

# Select variables
movies <- movies %>%
    select(movie_title, budget_mil, revenue_mil, duration, content_rating, imdb_score, genres, movie_facebook_likes)

# Drop rows with missing observations
movies <- movies %>%
    drop_na(any_of(c("budget_mil", "revenue_mil", "duration", "content_rating", "imdb_score", "genres", "movie_facebook_likes")))

# Output data set
write.csv(movies, "data/Movies2016.csv", row.names=FALSE)

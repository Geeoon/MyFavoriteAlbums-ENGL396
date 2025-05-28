# this file defines functions related to the release year of albums
# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List all of the years
# Used to populate the pull-down menu
all_years <- sort(unique(album_data$Year))

#' @brief # List the top albums for a year, in ranking order
#' 
#' @param year.var the year to filter to
#' @return the sorted list of albums for a year
#' @examples 
#' year_albums(1999)
#' year_albums(1979)
year_albums <- function(year.var){
  year_list <- select(filter(album_data[order(album_data$Ranking),], Year == year.var), Ranking, Album, Artist)
}

year_albums(2024)

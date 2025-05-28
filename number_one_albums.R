# this file defines functions for the best albums of years
# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List the Number 1 album for each year in the indicated range
#' @brief gets the highest ranked album for each year in a range
#' 
#' @param var.startyear the starting year of the range, inclusive
#' @param var.endyear the ending year of the range, inclusive
#' @return the top albums for the selected range
#' @examples 
#' number_one_album(1994, 2007)
#' number_one_album(2007, 2024)
number_one_album <- function(var.startyear, var.endyear){
  top_albums <- select(filter(album_data, Ranking ==1, Year >= var.startyear, Year <= var.endyear), Year, Album, Artist)
}

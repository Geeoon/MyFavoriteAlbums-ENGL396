# this file defines functions related to vinyl ownership
library(dplyr)
library(DT)

# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

#' Find top-rated albums that the person does not own on vinyl
#' 
#' @return albums ranked 9 or higher not on vinyl
missing_vinyl <- function(){
  buy_vinyl <- select(filter(album_data[order(-album_data$Rating),], Rating >= 9, Vinyl ==""), Album, Artist, Rating)
}

#' Sort years by vinyl ownership, from most to least
#' 
#' @return a sorted list of years and the number of vinyls owned, from most to least
year_most_vinyl <-function(){
  # selects albums that are owned on vinyl
  most_vinyl <- select(filter(album_data, Vinyl == "v"), Year)
  # groups years by number of vinyls owned
  most_vinyl_count <- filter(most_vinyl) %>% count(Year)
  # sorts each year by number of vinyl owned, descending
  most_vinyl_sort <- most_vinyl_count[order(-most_vinyl_count$n),] 
}
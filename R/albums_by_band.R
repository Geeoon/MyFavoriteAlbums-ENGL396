# this file defines the functions used for calculating statistics on an artist's albums

library(dplyr)
library(DT)

# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List all of the bands in alphabetical order
# Used to populate the pull-down menu
all_bands <- sort(unique(album_data$Artist))

#' Calculates an artists albums ranked by release year
#' 
#' @param band.var the name of the band 
#' @return the sorted list of albums and rankings
#' @examples 
#' albums_by_bands("The Strokes")
#' albums_by_bands("The Smashing Pumpkins")
albums_by_bands <- function(band.var){
  # get the bands albums ordered by release year, descending
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
}

#' Calculate an artist's average rating and prints it
#' 
#' @param band.var the name of the band
#' @return the artist's average rating
#' @examples
#' band_mean_rating("The Get Up Kids")
#' band_mean_rating("The Beatles")
band_mean_rating <- function(band.var){
  # get the artist's albums
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  # calculate the average rating
  avg_rating <- mean(band_albums$Rating)
  print(paste0("Average Rating: ", format(round(avg_rating, 2), nsmall =2)))
}

#' Calculate an artist's number of ranked albums
#' 
#' @param band.var the name of the band
#' @return the number of ranked albums by a band
#' @examples
#' band_album_count("Buckethead")
#' band_album_count("Frank Zappa")
band_album_count <- function(band.var){
  # get the artist's albums
  band_albums <- select(filter(album_data[order(album_data$Year),], Artist==band.var), Album, Year, Rating)
  # count the number of albums
  band_count <-count(band_albums)
  print(paste0("Number of Albums Ranked: ", band_count))
}




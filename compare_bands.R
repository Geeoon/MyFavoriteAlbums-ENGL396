# this file defines functions used for comparing artists
# import library used for plotting
library(ggplot2)

#' @brief Compare rating of two bands' albums over time on a line chart
#' 
#' @param var.artist1 the first artist to compare, displayed as red
#' @param var.artist2 the second artist to compare, displayed as blue
#' @examples
#' band_album_comparison_chart("Elliott Smith", "Heatmiser")
#' band_album_comparison_chart("Blur", "Oasis")
band_album_comparison_chart <- function(var.artist1, var.artist2){
  # filter down to albums by the first artist
  band1_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist1), Artist, Album, Year, Rating)
  # filter down to albums by the second artist
  band2_albums <- select(filter(album_data[order(album_data$Year),], Artist==var.artist2), Artist, Album, Year, Rating)
  
  # ggplot plotting
  ggplot() +
    geom_line(data = band1_albums, aes(x = Year, y = Rating), color = "red") +  # define the lines to draw for the first artist
    geom_line(data = band2_albums, aes(x = Year, y = Rating), color = "blue") +  # define the lines to draw for the second artist
    geom_point(data = band1_albums, aes(x = Year, y = Rating)) +  # define the points to plot for the first artist
    geom_point(data = band2_albums, aes(x = Year, y = Rating)) +  # define the points to plot for the second artist
    xlab("Year")+  # set the x-axis label to the year
    ylab("Rating")+  # set the y-axis label to the rating
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))+  #
    ggtitle(paste0("Album Ratings for " , band1_albums$Artist, "(Red) and ", band2_albums$Artist, "(Blue)"))+
    scale_x_continuous(breaks=seq(1993,2024,1))+
    scale_y_continuous(breaks=seq(0,10,1))+
    expand_limits(x=c(1993,2024), y=c(0,10))
}
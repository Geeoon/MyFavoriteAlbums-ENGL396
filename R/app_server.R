# this file defines the main backend R logic for the app

library(shiny)
library(dplyr)

#' This function is the main server "function" with all of the logic
#' 
#' @param input the user input to the server to be processed
#' @param output the corresponding output to be displayed
#' @examples 
#' shinyApp(ui = ui, server = server)
server <- function(input, output) {

  # displays the title of the page, seen at the top left of the page
  output$title <- renderUI({
    HTML("<h1>My Favorite Albums</h1><br>")
  })   
  
# First tab, Number One Albums
  # line breaks
  output$text3 <- renderUI({
    HTML("<br><br>")
  })  
  
  # display the number one albums based on the input years
  output$number_one_table <- renderTable({
    return(number_one_album(input$rng[1], input$rng[2]))
  })
  
# Second tab, Bands and Artists
  # line breaks
  output$text <- renderUI({
    HTML("<br><br>")
  })
  
  output$text2 <- renderUI({
    HTML("<br><br>")
  })
 
  # on submit pressed, update the artist in the album table
  observeEvent(input$action_button,{
    # display the albums and their ratings
    output$album_table <- renderTable({
      return(albums_by_bands(input$band_name))
    })
    
    # display the number of albums rated by the artist
    output$album_count <- renderText({
      return(band_album_count(input$band_name))
    })
    
    # display the average rating of the artist
    output$avg_rating <- renderText({
      return(band_mean_rating(input$band_name))
    })  
    
  })  
  
  # Third tab, Top Albums by Year
  output$text4 <- renderUI({
    HTML("<br><br>")
  })
  
  output$text5 <- renderUI({
    HTML("<br><br>")
  })
  
  # on submit, update the albums
  observeEvent(input$action_button2,{
    
    output$year_table <- renderTable({
      return(year_albums(input$year))
    })
    
  }) 
  
  # Fourth tab, Vinyl
  output$text6 <- renderUI({
    HTML("<h2>Top-rated vinyl that I don't own</h2><br>")
  })
  
  # display missing the albums missing on vinyl
  output$missing_vinyl_table <- renderTable({
    return(missing_vinyl())
  })
  
  output$text7 <- renderUI({
    HTML("<h2>Years for which I own the most vinyl</h2><br>")
  })
  
  # display the years with the most vinyl
  output$most_vinyl_table <- renderTable({
    return(year_most_vinyl())
  })
  
  # Fifth tab, Band Comparison
  output$text8 <- renderUI({
    HTML("<br><br>")
  })
  
  output$text8 <- renderUI({
    HTML("<br><br>")
  })
  
  # display the chart
  output$compare_bands <- renderPlot({
    return(band_album_comparison_chart(input$band_name_1, input$band_name_2))
  })
  
}



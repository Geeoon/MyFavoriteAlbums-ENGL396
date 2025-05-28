# This file builds the Shiny UI. It has five tabs.
# The file partners with app_server.R for inputs and outputs.
# The app.R file is the main file.
library(shiny)

# Grab the music data.
# See documentation for how to format the data
album_data <- read.csv("data/album-rankings.csv")

# List all of the bands in alphabetical order
# Used to populate the pull-down menu
all_bands <- sort(unique(album_data$Artist))

# List all of the years
# Used to populate the pull-down menu
all_years <- sort(unique(album_data$Year))

# the entire UI is defined in this element
# each tabPanel is the page for one of the categories
# you can add a new category by adding a new tabPanel
ui <- fluidPage(
    mainPanel(htmlOutput("title"),
      tabsetPanel(  # create the top tabs
        id = "tabset",
        tabPanel("Number One Albums",  # create the Number One Albums category
                 htmlOutput("text3"),
                 sliderInput("rng", "Choose the Years", value = c(1993, 1998), min = 1993, max = 2024),  # year selector
                 tableOutput("number_one_table")),
        tabPanel("Bands and Artists",  # create the Bands and Artists category
                 htmlOutput("text"),
                 selectInput("band_name", "Choose a band or artist:", all_bands),  # dropdown menu
                 actionButton("action_button", label = "Submit"),
                 htmlOutput("text2"),
                 tableOutput("album_table"),
                 textOutput("album_count"),
                 textOutput("avg_rating")),
        tabPanel("Top Albums by Year",  # create the Top Albums by Year category
                 htmlOutput("text4"),
                 selectInput("year", "Choose a year:", all_years),  # dropdown menu
                 actionButton("action_button2", label = "Submit"),
                 htmlOutput("text5"),
                 tableOutput("year_table")),
        tabPanel("Vinyl",  # create the Vinyl category
                 htmlOutput("text6"),
                 tableOutput("missing_vinyl_table"),
                 htmlOutput("text7"),
                 tableOutput("most_vinyl_table")),
        tabPanel("Band Comparison",  # create the Band Comparison category
                 htmlOutput("text8"),
                 selectInput("band_name_1", "First band or artist:", all_bands),  # dropdown menu
                 selectInput("band_name_2", "Second band or artist:", all_bands),  # dropdown menu
                 htmlOutput("text9"),
                 plotOutput("compare_bands"))
      )
    )
)

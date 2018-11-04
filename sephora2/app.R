#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(tidyverse)
library(tidytext)

x2 <- read_csv("sephora2.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Sephora reviews"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("Bins",
                  "Number of bins",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    
    x2 %>% 
      ggplot(aes(x = Loves, y = Number_of_reviews, col = Product_name )) + geom_point() +
      xlab("Number of loves") +
      ylab("Number of reviews") +
      ggtitle("Number of reviews versus number of loves for top eight bestselling skin products")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

library(shiny)
source("analysis.R")

shinyServer(function(input, output) {
  
  output$plot <- renderPlot(
    emission_plot(input$year, input$type)
  )
  
    
})

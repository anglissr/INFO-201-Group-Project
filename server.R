library(shiny)
source("analysis.R")

shinyServer(function(input, output) {
  
  output$plot <- renderPlot(
    emission_plot(input$year, input$type)
  )
  
  output$plot2 <- renderPlot(
    vehicles_by_year_plot(input$selection)
  )
  
    
})

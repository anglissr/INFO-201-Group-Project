library(shiny)
source("analysis.R")
library("dplyr")
library("ggplot2")


shinyServer(function(input, output) {
  
  output$plot <- renderPlot(
    emission_plot(input$year)
  )
    
})

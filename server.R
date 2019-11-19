library(shiny)
source("analysis.R")

shinyServer(function(input, output) {
    output$plot <- renderPlot(total_emissions_year)

})

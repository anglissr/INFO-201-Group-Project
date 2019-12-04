library(shiny)
library(leaflet)
source("analysis.R")

shinyServer(function(input, output) {
  output$plot <- renderPlot(
    emission_plot(input$year, input$type)
  )
  
  output$plot2 <- renderPlot(
    vehicles_by_year_plot(input$selection)
  )
  
  output$plot3 <- renderPlot(
    ev_sales_type_plot(input$selection2)
  )
  
  output$map1 <- renderLeaflet(
    ev_charging_plot()
  )
  
  output$stacked_emissions <- renderPlot(
    stacked_emissions_chart(input$stacked_select)
  )  
})

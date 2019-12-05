library(shiny)
library(leaflet)
source("analysis.R")

shinyServer(function(input, output) {
  output$emission_plot <- renderPlot(
    emission_plot(input$year, input$type)
  )

  output$vehicles_by_year_plot <- renderPlot(
    vehicles_by_year_plot(input$selection)
  )

  output$ev_sales_type_plot <- renderPlot(
    ev_sales_type_plot(input$selection2)
  )

  output$ev_charging_plot <- renderLeaflet(
    ev_charging_plot()
  )

  output$stacked_emissions <- renderPlot(
    stacked_emissions_chart(input$stacked_select)
  )
})
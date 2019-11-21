# testing shiny

library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$title("testing"),
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"),
    tags$meta(charset = "utf-8"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1, shrink-to-fit=no")
  ),

  navbarPage(
    id = "navbar",
    collapsible = TRUE,
    header = TRUE,
    position = c("fixed-top"),
    title = "Electric Vehicles",

    
    tabPanel("Home", 
               
    ),
    
    tabPanel("Carbon Emmissions in the US",
      tags$header(
        tags$div(
          id = "header",
            h1("Carbon Emmissions Over Time in the US")
        )
      ),
             
      sidebarLayout(
        sidebarPanel(
          sliderInput(inputId = "year", "Year", 1800, 2014, value = c(1900, 2000)),
          selectInput(inputId = "type", "Fuel Type", "Type", choices = c('Total' = 'Total', 'Solid Fuel' = 'Solid.Fuel', 'Liquid Fuel' = 'Liquid.Fuel','Gas Fuel' = 'Gas.Fuel')
          )
        ),
               
        mainPanel(
          plotOutput(outputId = "plot")   
        )
      )
    ),
    
    tabPanel("Viability", 
      sidebarLayout(
        sidebarPanel(
          "Text and interactive elements will go here"
        ),
        
        mainPanel(
          "Graph will go here"
        )
      )    
    ),
    
    tabPanel("Benefits", 
      sidebarLayout(
        sidebarPanel(
          "Text and interactive elements will go here"
        ),
               
        mainPanel(
          "Graph will go here"
        )
      )
    ),
    
    tabPanel("Improvements", 
      sidebarLayout(
        sidebarPanel(
          "Text and interactive elements will go here"
        ),
               
        mainPanel(
          "Graph will go here"
        )
      )             
    ),
    

    
    tabPanel("Team",
      
      tags$header(
        tags$div(
          id = "header",
          h1("The Team")
        )
      ),

      tags$div(
        class = "row",
        
        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "davis.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Davis Kurniawan"),
              tags$p("Major: [Text Here]"),
              tags$p(tags$button(class = "button", tags$a(href = "https://github.com/davisk83", "Github")))
            )
          )
        ),

        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "jareese.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Jareese Espinosa"),
              tags$p("Major: [Text Here]"),
              tags$p(tags$button(class = "button", tags$a(href = "https://github.com/JareeseEspinosa", "Github")))
            )
          )
        ),
        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "ryanangliss.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Ryan Angliss"),
              tags$p("Major: [Text Here]"),
              tags$p(tags$button(class = "button", tags$a(href = "https://github.com/anglissr", "Github")))
            )
          )
        ),
        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "spencer.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Spencer Boat"),
              tags$p("Major: [Text Here]"),
              tags$p(tags$button(class = "button", tags$a(href = "https://github.com/Nee-er", "Github")))
            )
          )
        ),

        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "pic.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Zhiyan Keriwn Jiao"),
              tags$p("Major: [Text Here]"),
              tags$p(tags$button(class = "button", tags$a(href = "https://github.com/Zhiyuan-Jiao", "Github")))
            )
          )
        )
      )
    )
  )
))

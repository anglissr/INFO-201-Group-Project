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
             
    ),
    
    tabPanel("Viability", 
             
    ),
    
    tabPanel("Benefits", 
             
    ),
    
    tabPanel("Better stuff", 
             
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
            tags$img(src = "pic.jpg", alt = "", style = "width:100%"),
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
            tags$img(src = "pic.jpg", alt = "", style = "width:100%"),
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
            tags$img(src = "pic.jpg", alt = "", style = "width:100%"),
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

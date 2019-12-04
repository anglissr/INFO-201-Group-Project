# testing shiny

library(shiny)
library(leaflet)

shinyUI(fluidPage(
  tags$head(
    tags$title("Code: Green"),
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"),
   #tags$style(type="text/css", "body {padding-top: 70px;}"),
    tags$meta(charset = "utf-8"),
    tags$meta(name = "viewport", content = "width=device-width,
              initial-scale=1, shrink-to-fit=no")
  ),

  navbarPage(
    id = "navbar",
    collapsible = TRUE,
    header = TRUE,
    position = c("fixed-top"),
    title = "Electric Vehicles",
    tabPanel("Home",
       tags$div(
         id = "affiliation",
         tags$p("INFO-201A: Technical Foundations of Informatics"),
         tags$p("The Information School"),
         tags$p("University of Washington"),
         tags$p("Autumn 2019")
       ),
       tags$div(
         id = "content",
         tags$h2("Overview"),
         tags$p("The problem situation is how vehicle emissions are
                impacting the climate in the US as well as the alternatives
                to emission producing vehicles; it has to do with the viability
                and impact of electric vehicles in the US, and how they might
                impact carbon emission on a global scale. Since the electric
                vehicle burns no gasoline and has no tailpipe, we thought that
                the electric vehicle might be a possible solution to relieve
                the pace of global warming.But we still need to analyze the
                data to see if an electric vehicle is really the best
                alternative."),
         tags$p("We are concerned about carbon emissions because carbon dioxide
                is one of the greenhouse gases that absorb radiation. It can
                also prevent heat from escaping our atmosphere which may
                disrupt weather patterns, higher global temperatures, and
                other changes in the climate. It has already had observable
                effects on the environment. Glaciers have shrunk, ice on rivers
                and lakes is breaking up. Intense heatwaves and severe
                hurricanes occurred."),
         tags$p("By the end of this project, we hope to have a better
                understanding about the impacts of electric vehicles on global
                emission. Looking into the future, it is clear that people will
                be moving to more sustainable approaches to energy, and
                electric vehicles may play and important role in that
                transition. Though we focused on a small factor in global
                greenhouse emissions, the conclusions we made can be expanded
                to relate to other topics in the study of environmental
                impacts."),
         tags$h2("Audience"),
         tags$p("The stakeholders in this situation are people in
                the US who are looking into buying vehicles currently
                or in the near future, however, much of the data we
                are using affects people globally. People are valuing
                our environment more and more, and with a growing debate
                around climate change, this topic is helpful in explaining
                one part of the problem."),
         tags$h2("Page Description"),
         tags$p("The carbon emissions page shows data visualization of the
                different type of carbon emissions in the US overtime. It
                can shows the biggest contribution from the different type
                of fuel from the interactive graph. The viability page shows
                the viability of electric vehicles and many different statistic
                of vehicles. The benefits tab shows the benefits of electric
                cars, different company impacts, and the decrease of carbon
                emissions. The improvement tab shows how electric cars can 
                be improved. Lastly the team tab shows information about us,
                the authors."),
       )
    ),

    tabPanel("Carbon Emissions in the US",
             tags$header(
               tags$div(
                 id = "header",
                 h1("Carbon Emissions Over Time in the US")
               )
             ),

      sidebarLayout(
        sidebarPanel(
          sliderInput(inputId = "year", "Year", 1800, 2014,
                      value = c(1900, 2000)),
          selectInput(inputId = "type", "Fuel Type", "Type",
                      choices = c("Total" = "Total",
                                  "Solid Fuel" = "Solid.Fuel",
                                  "Liquid Fuel" = "Liquid.Fuel",
                                  "Gas Fuel" = "Gas.Fuel")
          )
        ),
        mainPanel(
          plotOutput(outputId = "plot")
        )
      )
    ),

    tabPanel("Viability",
             tags$header(
               tags$div(
                 id = "header",
                 h1("Viability of Electric Vehicles")
               )
             ),
             fluidRow(
               sidebarPanel(
                 selectInput(inputId = "selection", "selection",
                             choices = c("Vehicles Registered (thousands)" = "V2",
                                         "Vehicle KM traveled (millions)" = "V3",
                                         "Fuel Consumed (million liters)" = "V4",
                                         "Average fuel consumed per vehicle (liters)" =
                                           "V7"))
               ),
               
               mainPanel(
                 plotOutput(outputId = "plot2")
               )
             ),
             fluidRow(
               sidebarPanel(
                 selectInput(inputId = "selection2", "selection", choices = c("Hybrid Electric" = "V2", "Plug-in Hybrid-electric" = "V3", "	Electric" = "V4"))
               ),
               
               mainPanel(
                 plotOutput(outputId = "plot3")   
               )
             )
    ),

    tabPanel("Benefits",
      sidebarLayout(
        sidebarPanel(
          tags$p("Text and interactive elements will go here")
        ),

        mainPanel(
          
        )
      )
    ),

    tabPanel("Improvements",
      tags$header(
        tags$div(
          id = "header",
          h1("Improving Electric Vehicles")
        )
      ),       
      fluidRow (
        leafletOutput("map1")
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
              tags$p(tags$button(class = "button",
                                 tags$a(href = "https://github.com/davisk83",
                                        "Github")))
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
              tags$p(tags$button(class = "button", tags$a(href =
                                                            "https://github.com/JareeseEspinosa",
                                                          "Github")))
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
              tags$p(tags$button(class = "button", tags$a(href =
                                                            "https://github.com/anglissr",
                                                          "Github")))
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
              tags$p(tags$button(class = "button", tags$a(href =
                                                            "https://github.com/Nee-er",
                                                          "Github")))
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
              tags$p(tags$button(class = "button", tags$a(href =
                                                            "https://github.com/Zhiyuan-Jiao",
                                                          "Github")))
            )
          )
        )
      )
    )
  )
))

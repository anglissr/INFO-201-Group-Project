# testing shiny

library(shiny)
library(leaflet)
source("analysis.R")

shinyUI(fluidPage(
  tags$head(
    tags$title("Code: Green"),
    tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css"),
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
    tabPanel(
      "Home",
      tags$header(
        tags$div(
          id = "header",
          h1("About our Project")
        )
      ),
      fluidRow(
        tags$div(
          id = "content",
          tags$h3("Overview"),
          tags$p("Our project is structured around the idea of whether or not electric
                  vehicles can be a viable option in reducing carbon emissions in the
                  US. We decided to research and answer this questions using two
                  approaches. First, we would look at emessions broadly, either by sector
                  or by type of fuel, to get a better understanding of the imapacts, both
                  past and present. Then, we could make a guess as to EVs could actually
                  impact the emissions present in the US today. Our second approach would
                  be to look at electric vehicles more specifically, and find what needs
                  to be done to make them more mainstream and practical for an average
                  American. With both these strategies in mind, we started working on
                  gathering sets and wrangling data to create this project."),
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
          tags$h3("Audience"),
          tags$p("The stakeholders in this situation are people in
                  the US who are looking into buying vehicles currently
                  or in the near future, however, much of the data we
                  are using affects people globally. People are valuing
                  our environment more and more, and with a growing debate
                  around climate change, this topic is helpful in explaining
                  one part of the problem."),
          tags$h3("Tab Descriptions"),
          tags$p("The carbon emissions page shows data visualization of the
                  different type of carbon emissions in the US overtime. It
                  can shows the biggest contribution from the different type
                  of fuel from the interactive graph. The viability page shows
                  the viability of electric vehicles and many different statistic
                  of vehicles. The other sources tab shows the other major
                  emission sources besides vehicles displayed in the interactive
                  graph. The improvement tab shows how electric cars can
                  be improved. Lastly the team tab shows information about us,
                  the authors."),
          tags$div(
            tags$h3("The Data"),
            tags$p("Below are the datasets that we utilized for this project:"),
            tags$ul(
              tags$li(tags$a(href = "https://cdiac.ess-dive.lbl.gov/","Carbon Dioxide Information Analysis Center (CDIAC) CO2 Emissions")),
              tags$li(tags$a(href = "https://data.austintexas.gov/Utilities-and-City-Services/Plug-In-EVerywhere-Charging-Station-Network/k5hp-eece/data","Plug-In EVerywhere EV Charging Stations")),
              tags$li(tags$a(href = "https://www.epa.gov/ghgemissions/inventory-us-greenhouse-gas-emissions-and-sinks-1990-2017", "EPA Carbon Emissions by Sector")),
              tags$li(tags$a(href = "https://www.bts.gov/content/motor-vehicle-fuel-consumption-and-travel-metric", "US DOT Bureau of Transportation Motor Vehicle Stats")),
              tags$li(tags$a(href = "https://www.bts.gov/content/gasoline-hybrid-and-electric-vehicle-sales", "US DOT Bureau of Transportation EV Sales"))
            )
          ),
          tags$div(
            id = "affiliation",
            tags$p("INFO-201A: Technical Foundations of Informatics"),
            tags$p("The Information School"),
            tags$p("University of Washington"),
            tags$p("Autumn 2019")
          )
        )
      )
    ),

    tabPanel(
      "Carbon Emissions in the US",
      tags$header(
        tags$div(
          id = "header",
          h1("Carbon Emissions Over Time in the US")
        )
      ),

      fluidRow(
        tags$h3("Emissions: A Brief Overview"),
        tags$p("In order to tackle the question of whether or not electric
                vehicles are a viable option to decrease carbon emissions,
                an understanding of the history or United States's emissions
                is needed. Thanks to",
               tags$a(href = "https://cdiac.ess-dive.lbl.gov/",
                      "Data from the Carbon Dioxide Information
                      Analysis Center (CDIAC)"),
               ", we were able to obtain a dataset of the US's CO2 emissions
               from fossil-fuels annually since 1800. The data set consists
               of carbon emissions from liquid fuel consumption, gas fuel
               consumtion, solid fuel consumption, as well as some more
               insignificant sources of CO2 emissions. In the graph below,
               you can select a range of year and type of fuel to see the
               amount of C02 in millions metric tons. Though all of this
               data is useful, we are most concerned with the CO2
               emissions caused by Liquid Fuel (aka gasoline).")
      ),
      fluidRow(
        sidebarPanel(
          sliderInput(
            inputId = "year", "Year", 1800, 2014,
            value = c(1900, 2000)
          ),
          selectInput(
            inputId = "type", "Fuel Type", "Type",
            choices = c(
              "Total" = "Total",
              "Solid Fuel" = "Solid.Fuel",
              "Liquid Fuel" = "Liquid.Fuel",
              "Gas Fuel" = "Gas.Fuel"
            )
          )
        ),
        mainPanel(
          plotOutput(outputId = "emission_plot")
        )
      ),
      fluidRow(
        tags$h3("Conclusions"),
        tags$p("While this data a mostly out of the scope of this project,
               it is still important to understand the impact of carbon emissions
               and to actually see the growth with a plot like this. It is also
               interesting to use this data to compare by fuel type, 
               to see how liquid fuel compares to solid fuel and etc. A final piece
               of relevant data from this graph is the fact that the amount of total
               emissions decreased in the US from about 2005 to present, as the US
               moves to more renewable and clean sources of energy.")
      )
    ),

    tabPanel(
      "Viability",
      tags$header(
        tags$div(
          id = "header",
          h1("Viability of Electric Vehicles")
        )
      ),
      fluidRow(
        tags$h3("Electric Vehicles: Capable of Success?"),
        tags$p("A large focus of this project involves looking the the
                current viability of Electric Vehicles, as well as looking
                into the past and ahead to the future in order to predict
                the effectiveness of EVs. In looking at whether EVs were
                capable of success, we first looked to the United States
                D.O.T. statistics on vehicles as a whole, so we could get an
                idea of the trend lines and see how EVs could impact the data.
                We then turned to data specifically about the number of EVs
                purchased over a certain time, so we could set up a comparison
                and gather insight as to the popularity of EVs. Below are the
                two plots displaying this data. They both have the same x-axis
                range so that comparisons are able to be made. In the first
                plot, you can select between seeing registered vehicles or
                other travel data of light duty vehicles, buses, trucks and
                motorcycles in the US. The second plot can show the number
                of EV sales during that same time period.")
      ),
      hr(),
      fluidRow(
        tags$h3("Plot 1"),
        sidebarPanel(
          selectInput(
            inputId = "selection", "Select",
            choices = c(
              "Vehicles Registered (thousands)" = "V2",
              "Vehicle KM traveled (millions)" = "V3",
              "Fuel Consumed (million liters)" = "V4",
              "Average fuel consumed per vehicle (liters)" =
                "V7"
            )
          )
        ),

        mainPanel(
          plotOutput(outputId = "vehicles_by_year_plot")
        )
      ),
      fluidRow(
        tags$h3("Plot 2"),
        sidebarPanel(
          selectInput(inputId = "selection2", "Select",
                      choices = c("Hybrid Electric" = "V2",
                                  "Plug-in Hybrid-electric" = "V3",
                                  "	Electric" = "V4"))
        ),

        mainPanel(
          plotOutput(outputId = "ev_sales_type_plot")
        )
      ),
      hr(),
      fluidRow(
        tags$h3("Conclusions"),
        tags$p("A whopping 272,000,000 vehicles were registerd in the US in
                2017. However, only 565,930 electric vehicles were purchased
                the same year making up only 0.2% of vehicles registered during
                the year. Even if we look at 2013, which saw a small spike in
                EV sales, only 592,229 cars were sold, still on 0.21% of
                vehicles registered. Though that number is very small, there
                is still a massive trend in electric vehicle purchases, evident
                by the steep incline on the graph. With this in mind, it is
                clear that electric vehicles have a very long way to go before
                they are able to be deemed 'mainstream', but this growth, if
                assumed to continue, is a good sign for the future of EV's in
                the US")
      )
    ),

    tabPanel(
      "Improvements",
      tags$header(
        tags$div(
          id = "header",
          h1("Improving Electric Vehicles")
        )
      ),
      fluidRow(
          tags$h3("What is There to Improve?"),
          tags$p("If you ask a random person what their biggest concern is
                  for electric vehicles, many of their answers revolve around
                  one feature of these types of cars; charging. Where are
                  charging stations near me? How far can I get before my car
                  dies? All these are valid questions and lead to valid
                  critiques of electric vehicles. While many cities are
                  implementing electric car charging stations, the city
                  of Austin Texas has a dataset from their",
                  tags$a(href = "https://data.austintexas.gov/Utilities-and-
                  City-Services/Plug-In-EVerywhere-Charging-Station-Network
                  /k5hp-eece/data",
                      "Plug-In EVerywhere"),
                  "charging station network. Below is a map of all of car
                  charging stations accross Austin, as well as their address
                  and the name of the orginization that owns and manages
                  them.")
      ),
      fluidRow(
        leafletOutput("ev_charging_plot")
      ),
      fluidRow(
        tags$h3("Conclusions"),
        tags$p("The reason we are including this data set in our project
                 is to bring atention to one of the largest concerns for
                 possible owners of EVs. If other cities adopt new technologies
                 and make access to electric car charging easier, we think there
                 could be a spike in EV sales, further impacting CO2 Emissions.")
      )
    ),

    tabPanel(
      "Other Sources",
      tags$header(
        tags$div(
          id = "header",
          h1("Other Major Emission Sources")
        )
      ),
      fluidRow(
          tags$h3("Transportation is Not Everything"),
          tags$p("While making the switch to electric cars would make a dent in
                  the largest contributor to emissions in 2017, electricity
                  production is the second biggest contributor to emissions,",
                  tags$a("according to the EPA.",
                         href = "https://www.epa.gov/ghgemissions/inventory-us-greenhouse-gas-emissions-and-sinks-1990-2017"),
                 "The electric power sector used to make up the largest portion
                 of greenhouse gas emissions in the US, peaking in 2007. Over
                 the last decade, emissions from electricity production has
                 trended downwards and will continue in that direction as the
                 US adopts more alternative energy sources. Meanwhile,
                 emissions from transportation have trended upwards over
                 the same period of time. Making the switch to electric cars
                 is one of the first major steps in starting a similar downward
                 trend in the emissions from transportation. Below is a graph
                 that breaks down the total greenhouse gas emissions by
                 industry from 1990 to 2017.")
      ),
      fluidRow(
        checkboxGroupInput(inputId = "stacked_select",
                           "Select", stacked_input,
                           selected = c("Transportation",
                                        "Electric Power Sector"))
      ),
      fluidRow(
        plotOutput(outputId = "stacked_emissions")
      )
    ),

    tabPanel(
      "Team",

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
              tags$p(tags$button(class = "button", tags$a(
                  href = "https://github.com/davisk83",
                  "Github"
                )
              ))
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
              tags$p(tags$button(class = "button", tags$a(
                href =
                  "https://github.com/JareeseEspinosa",
                "Github"
              )))
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
              tags$p(tags$button(class = "button", tags$a(
                href =
                  "https://github.com/anglissr",
                "Github"
              )))
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
              tags$p(tags$button(class = "button", tags$a(
                href =
                  "https://github.com/Nee-er",
                "Github"
              )))
            )
          )
        ),

        tags$div(
          class = "column",
          tags$div(
            class = "card",
            tags$img(src = "zhiyuan.jpg", alt = "", style = "width:100%"),
            tags$div(
              class = "container",
              tags$h3("Zhiyan Keriwn Jiao"),
              tags$p(tags$button(class = "button", tags$a(
                href =
                  "https://github.com/Zhiyuan-Jiao",
                "Github"
              )))
            )
          )
        )
      )
    )
  )
))

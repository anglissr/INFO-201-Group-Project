library(dplyr)
library(ggplot2)
library(leaflet)
library(stringr)
library(reshape2)

emissions_by_nation <- read.csv("data/co2_emission_by_nation.csv", stringsAsFactors = FALSE)
sales_by_year_original <- read.csv("data/EV_sales_by_year.csv", stringsAsFactors = FALSE)
electric_vehicle_sales_type <- t(read.csv("data/electric_vehicle_sales.csv", stringsAsFactors = FALSE))
vehicles_by_year <- t(read.csv("data/vehicles_by_year.csv", stringsAsFactors = FALSE))
ev_charging <- read.csv("data/Plug-In_EVerywhere_Charging_Station_Network.csv", stringsAsFactors = FALSE)

emissions_us <- emissions_by_nation %>%
  filter(Country == "UNITED STATES OF AMERICA")

emission_plot <- function(year, type) {
  emissions_us <- emissions_by_nation %>%
    filter(Country == "UNITED STATES OF AMERICA") %>%
    filter(Year > year[1] & Year < year[2])
  total_emissions_year <- ggplot(emissions_us, aes(x = Year, y = !!as.name(type), group=1)) +
    geom_line()+
    labs(title = "CO2 Emissions in the US",
         subtitle = "(1800 - 2014)",
         caption = "Data from the Carbon Dioxide Information Analysis Center") +
    theme_minimal() + 
    scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}, limits = c(0, 1600000), breaks = seq(0, 1600000, by = 100000))
  return(total_emissions_year)
}


Year <- rownames(vehicles_by_year)
rownames(vehicles_by_year) <- NULL
vehicles_by_year <- as_data_frame(cbind(Year,vehicles_by_year))
vehicles_by_year$Year <- gsub('X', '', vehicles_by_year$Year)
vehicles_by_year <- filter(vehicles_by_year, Year >= 1999)
vehicles_by_year$V2 <- as.numeric(gsub(",", "", vehicles_by_year$V2))
vehicles_by_year$V3 <- as.numeric(gsub(",", "", vehicles_by_year$V3))
vehicles_by_year$V4 <- as.numeric(gsub(",", "", vehicles_by_year$V4))
vehicles_by_year$V7 <- as.numeric(gsub(",", "", vehicles_by_year$V7))

vehicles_by_year_plot <- function(selection) {
  vehicles_year_plot <- ggplot(data = vehicles_by_year) +
    geom_col(mapping = aes(x = Year, y = !!as.name(selection)), fill = "#336699") +
    labs(title = "Vehicle Stats by Year in the US",
         subtitle = "(1999 - 2017)",
         caption = "Data from the Bureau of Transportation Statistics (US DOT)",
         y = "") +
    theme_classic() +
    scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}, breaks = waiver())
  return(vehicles_year_plot)
}

Year <- rownames(electric_vehicle_sales_type)
rownames(electric_vehicle_sales_type) <- NULL
electric_vehicle_sales_type <- as_data_frame(cbind(Year,electric_vehicle_sales_type))
electric_vehicle_sales_type$Year <- gsub('X', '', electric_vehicle_sales_type$Year)
electric_vehicle_sales_type <- electric_vehicle_sales_type[-1,]
electric_vehicle_sales_type$V2 <- as.numeric(as.character(electric_vehicle_sales_type$V2))
electric_vehicle_sales_type$V3 <- as.numeric(as.character(electric_vehicle_sales_type$V3))
electric_vehicle_sales_type$V4 <- as.numeric(as.character(electric_vehicle_sales_type$V4))

ev_sales_type_plot <- function(selection2) {
  sales_type_plot <- ggplot(data = electric_vehicle_sales_type) +
    geom_col(mapping = aes(x = Year, y = !!as.name(selection2)), fill = "#33cc33") +
    labs(title = "Electric Vehicle Sales by Type of EV in the US",
         subtitle = "(1999 - 2017)",
         caption = "Data from the Bureau of Transportation Statistics (US DOT)",
         y = "") +
    theme_classic() +
    scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}, limits = c(0, 500000), breaks = seq(0, 500000, by = 50000))
    
  return(sales_type_plot)
}

get_lat <- function(string) { 
  as.numeric(trimws(str_replace(unlist(strsplit(string, ","))[1], "[(]", "")))
}

get_lon <- function(string) {
  as.numeric(trimws(str_replace(unlist(strsplit(string, ","))[2], "[)]", "")))
}

ev_charging$lat <- lapply(ev_charging$New.Georeferenced.Column, get_lat)
ev_charging$lon <- lapply(ev_charging$New.Georeferenced.Column, get_lon)
locations <- data.frame(
  label = paste(ev_charging$Address..1, "<br>", ev_charging$Org.Name, sep = ""),
  latitude = unlist(ev_charging[14]),
  longitude = unlist(ev_charging[15])
)

ev_charging_plot <- function(df = locations) {
  leaflet(data = df) %>% 
    addTiles() %>%
    addMarkers(
      lat = ~latitude,
      lng = ~longitude, 
      popup = ~label
    )
}

#Stacked Bar Chart
epa_data <- read.csv("data/EPA_all_greenhouse.csv", stringsAsFactors = FALSE)
epa_data <- epa_data %>%
  select(-"Table.2.1...Recent.Trends.in.U.S..Greenhouse.Gas.Emissions.and.Sinks..MMT.CO2.Eq..")
colnames(epa_data) <- epa_data[2,]
epa_data <- epa_data[-c(1,2,95:105,34,54,72,57,56,35,74,73,55,84,80,89,71,90),]
epa_data[-1] <- lapply(epa_data[-1], as.numeric)
epa_data <- epa_data %>%
  group_by(`Gas/Source`) %>%
  summarize_each(sum)
epa_chart_data <- epa_data %>%
  gather(key = "Year", value = "emissions", -`Gas/Source`)
epa_chart_data <- epa_chart_data %>%
  filter(!is.na(emissions), 
         emissions >= 100,
         !`Gas/Source` == "Total Emissions",
         !`Gas/Source` == "CH4c",
         !`Gas/Source` == "CO2",
         !`Gas/Source` == "N2Oc",
         !`Gas/Source` == "Fossil Fuel Combustion")
colnames(epa_chart_data) <- c("Source", "Year", "Emissions (Million Metric Tonnes)")
epa_bar_chart <- ggplot(epa_chart_data) +
  geom_col(
    mapping = aes(x = `Year`, y = `Emissions (Million Metric Tonnes)`, fill = `Source`)
  )
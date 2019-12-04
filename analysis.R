library("dplyr")
library("ggplot2")

emissions_by_nation <- read.csv("data/co2_emission_by_nation.csv", stringsAsFactors = FALSE)
sales_by_year_original <- read.csv("data/EV_sales_by_year.csv", stringsAsFactors = FALSE)
electric_vehicle_sales_type <- t(read.csv("data/electric_vehicle_sales.csv", stringsAsFactors = FALSE))
vehicles_by_year <- t(read.csv("data/vehicles_by_year.csv", stringsAsFactors = FALSE))

emissions_us <- emissions_by_nation %>%
  filter(Country == "UNITED STATES OF AMERICA")

emission_plot <- function(year, type) {
  emissions_us <- emissions_by_nation %>%
    filter(Country == "UNITED STATES OF AMERICA") %>%
    filter(Year > year[1] & Year < year[2])
  total_emissions_year <- ggplot(emissions_us) +
    geom_col(mapping = aes(x = Year, y = !!as.name(type)))
  return(total_emissions_year)
}


Year <- rownames(vehicles_by_year)
rownames(vehicles_by_year) <- NULL
vehicles_by_year <- as_data_frame(cbind(Year,vehicles_by_year))
vehicles_by_year$Year <- gsub('X', '', vehicles_by_year$Year)
vehicles_by_year <- filter(vehicles_by_year, Year >= 1999)

vehicles_by_year_plot <- function(selection) {
  vehicles_year_plot <- ggplot(data = vehicles_by_year) +
    geom_col(mapping = aes(x = Year, y = !!as.name(selection))) +
    ylab("") +
    ggtitle("Vehicle Stats by Year in the US")
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
    geom_col(mapping = aes(x = Year, y = !!as.name(selection2))) +
    ylab("") +
    scale_y_continuous(labels=function(n){format(n, scientific = FALSE)})
  return(sales_type_plot)
}
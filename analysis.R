library("dplyr")
library("ggplot2")

emissions_by_nation <- read.csv("data/co2_emission_by_nation.csv", stringsAsFactors = FALSE)
sales_by_year_original <- read.csv("data/EV_sales_by_year.csv", stringsAsFactors = FALSE)


emissions_us <- emissions_by_nation %>%
  filter(Country == "UNITED STATES OF AMERICA") %>%
  filter(Year > 1950)

total_emissions_year <- ggplot(emissions_us) +
  geom_col(mapping = aes(x = Year, y = Total))

           
           
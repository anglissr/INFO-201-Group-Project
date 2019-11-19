library("dplyr")
library("ggplot2")

emissions_by_nation <- read.csv("data/co2_emission_by_nation.csv", stringsAsFactors = FALSE)

emissions_us <- emissions_by_nation %>%
  filter(Country == "UNITED STATES OF AMERICA")

total_emissions_year <- ggplot(emissions_us) +
  geom_col(mapping = aes(x = Year, y = Total))

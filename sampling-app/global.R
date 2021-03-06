library(shiny)
library(shinydashboard)
library(leaflet)
library(plotly)

quakes <- read.csv(file = "/Users/anthony/Documents/shiny-apps/sampling-app/earthquakes_feb16.csv")
names(quakes)[2:3] <- c("lat", "long")
quakes <- quakes[!is.na(quakes$mag), ]

# Add Date to each Earthquake
quakes$date <- substr(quakes$time, 1, 10)

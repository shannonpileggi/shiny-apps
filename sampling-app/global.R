library(shiny)
library(shinydashboard)
library(leaflet)
library(RColorBrewer)

quakes <- read.csv(file = "/Users/anthony/Documents/shiny-apps/sampling-app/earthquakes_feb16.csv")
names(quakes)[2:3] <- c("lat", "long")
quakes <- quakes[!is.na(quakes$mag), ]

## Server.R

shinyServer(function(input, output, session) {
  
  # Reactive expression for the data subsetted to what the user selected
  filteredData <- reactive({
    quakes[quakes$lat > input$map_bounds$south & quakes$lat < input$map_bounds$north
          & quakes$long > input$map_bounds$west & quakes$long < input$map_bounds$east, ]
  })
  
  # Draw Samples
  drawSamples <- reactive({
    input$redraw_sample
    N <- isolate(input$n_samples)
    n <- isolate(input$sample_size)
    quakesf <- filteredData()$mag
    matrix(quakesf[sample(length(quakesf), N * n, replace = TRUE)], nrow = N, ncol = n)
  })
  
  output$map <- renderLeaflet({
    # Use leaflet() here, and only include aspects of the map that
    # won't need to change dynamically (at least, not unless the
    # entire map is being torn down and recreated).
    leaflet(quakes) %>% 
        addTiles() %>%
        addCircles(radius = ~10^mag, weight = 1, color = "#777777",
                    fillColor = "firebrick", fillOpacity = 0.7, 
                    popup = ~paste0(date, "</br> Magnitude = ", mag)) %>%
        setView(lng = -90, lat = 38.88, zoom = 3)
  })
  
  output$histogram1 <- renderPlotly({
    n <- dim(filteredData())[1]
    N <- dim(quakes)[1]
    plot_ly(x = filteredData()$mag, type = "histogram") %>%
      layout(title = paste0(n, " / ", N, " (", floor(100*(n/N)), "%)"), 
             xaxis = list(title = "Magnitude"))
  })
  
  output$histogram2 <- renderPlotly({
    plot_ly(x = drawSamples()[1, ], opacity = 0.6, type = "histogram", group = "Sample 1") %>%
      add_trace(x = drawSamples()[2, ], visible = "legendonly", group = "Sample 2") %>%
      add_trace(x = drawSamples()[3, ], visible = "legendonly", group = "Sample 3") %>%
      add_trace(x = drawSamples()[4, ], visible = "legendonly", group = "Sample 4") %>%
      add_trace(x = drawSamples()[5, ], visible = "legendonly", group = "Sample 5") %>%
      layout(barmode="overlay", 
              xaxis = list(title = "Magnitude", 
                           range = range(filteredData()$mag)))
  })
  
  output$histogram3 <- renderPlotly({
    plot_ly(x = apply(drawSamples(), 1, mean), type = "histogram") %>%
      layout(xaxis = list(title = "Average Magnitude",
                          range = range(filteredData()$mag)))
  })
  
})


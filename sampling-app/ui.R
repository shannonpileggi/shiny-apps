## ui.R
dashboardPage(skin = "green",
  
  dashboardHeader(title = "Sampling Distributions"),
  
  dashboardSidebar(disable = TRUE),
  
  dashboardBody(
    
    fluidRow(
      
      box(
        title = "Description",
        width = 10,
        "Move around the map to change the population, then draw samples and compare the distributions."
      )
    ),
    
    fluidRow(
      
      box(
        width = 7,
        leafletOutput("map", height = 250)
      ),
      
      box(
        title = "Population Distribution",
        width = 3,
        plotlyOutput("histogram1", height = "200px")
      )
    ),
    
    fluidRow(
      
      box(
        title = "Inputs",
        width = 2,
        numericInput("n_samples", "Number of Samples", value = 100, min = 1),
        numericInput("sample_size", "Sample Size", value = 30, min = 5),
        actionButton("redraw_sample", "Redraw", icon = icon("refresh"))
      ),
      
      box(
        title = "Individual Samples",
        width = 4,
         plotlyOutput("histogram2", height = "200px")
      ),
      
      box(
        title = "Distribution of the Sample Mean",
        width = 4,
        plotlyOutput("histogram3", height = "200px")
      )
    )
  )
)

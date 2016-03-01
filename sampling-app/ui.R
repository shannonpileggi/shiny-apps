## ui.R
dashboardPage(skin = "green",
  
  dashboardHeader(title = "Sampling Distributions"),
  
  dashboardSidebar(disable = TRUE),
  
  dashboardBody(
    
    fluidRow(
      
      box(
        title = "User Inputs",
        width = 4,
        sliderInput("range", "Magnitudes", min(quakes$mag), max(quakes$mag),
          value = range(quakes$mag), step = 0.1
        ),
        selectInput("colors", "Color Scheme",
          rownames(subset(brewer.pal.info, category %in% c("seq", "div")))
        ),
        checkboxInput("legend", "Show legend", TRUE)
      ),
      
      box(
        width = 8,
        leafletOutput("map", height = 250)
      )
    ),
    
    fluidRow(
      
      box(
        title = "Inputs",
        width = 2,
        numericInput("n_samples", "Number of Samples", value = 100, min = 1),
        numericInput("sample_size", "Sample Size", value = 30, min = 1)
      ),
      
      box(
        title = "Population Distribution",
        width = 3,
        plotOutput("histogram1")
      ),
      
      box(
        title = "Sampling Distribution",
        width = 3,
        plotOutput("histogram2")
      ),
      
      box(
        title = "Recent Sample",
        width = 3,
        plotOutput("histogram3")
      )
    )
  )
)

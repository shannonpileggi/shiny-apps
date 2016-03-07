# Shiny Apps

You may need to install some packages first:
```r
install.packagesy(shiny)
install.packages(shinydashboard)
install.packages(leaflet)
install.packages(plotly)
```

To run this app directly from github, use the `devtools` packages:
```r
# Install/Load devtools
install.packages(devtools)
library(devtools)

# Run sampling-app
shiny::runGitHub(repo = "shiny-apps", username = "anthonypileggi", subdir = "sampling-app")
```

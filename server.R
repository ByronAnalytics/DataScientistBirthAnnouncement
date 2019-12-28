# Server Logic
library(shiny)
if(!require("mapview")) install.packages("mapview"); library(mapview);
source("appFunctions.R")
load(file="Data/HouseData.Rdata")



shinyServer(function(input, output) {

  output$DivPlot <- renderPlot({
    
    # Plots for Diversity Tab
    plotOut <- switch(input$divSelected,
                      Richness = calcRich,
                      Simpsons = calcSimp,
                      Shannon = calcShan)
  
    plotOut(HouseData)
  })
  
  output$AbunPlot <- renderPlot({

    
    # Plots for Abundance Tabs
    plotOut2 <- switch(input$abundSelected,
                      Total = calctotal,
                      Species = calcSpecies,
                      Age = calcAge)
    plotOut2(HouseData)

  })
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Photo Documentation",
        img(src ="images/BabyByron.jpg", width = 400, align = "middle"),
      easyClose = TRUE,
      footer = NULL
    ))
  })

})

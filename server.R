
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
if(!require("mapview")) install.packages("mapview"); library(mapview);
source("appFunctions.R")
load(file="Data/HouseData.Rdata")



shinyServer(function(input, output) {

  output$DivPlot <- renderPlot({
    
    plotOut <- switch(input$divSelected,
                      Richness = calcRich,
                      Simpsons = calcSimp,
                      Shannon = calcShan)
  
    plotOut(HouseData)
  })
  
  output$AbunPlot <- renderPlot({

    
    plotOut2 <- switch(input$abundSelected,
                      Total = calctotal,
                      Species = calcSpecies,
                      Age = calcAge)
    plotOut2(HouseData)

  })
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Photo Documentation",
      img(src ="images/Happy.JPG", width = 400, align = "middle"),
      img(src ="images/BabyByron.jpg", width = 400, align = "middle"),
      easyClose = TRUE,
      footer = NULL
    ))
  })

})

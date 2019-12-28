

# Return Data For Diversity plots
calcRich <- function(plotData){
  rich <- rep(2, times=length(plotData$Date))
  plot(rich~Date, data=plotData, type="l", ylim=c(0,5), ylab = "Species Richness",
       xlab = "Date", main = "Projected Species Richness Over Next 6 Months")
}


calcSimp <- function(plotData){
  
  hum <- plotData$Adults + plotData$Babies
  totAbun <- hum + plotData$Cats
  simInd <- 1/((hum/totAbun)^2 + (plotData$Cats/totAbun)^2)
  #HumError <- plotData$Adults + plotData$Babies*plotData$P_LaborPriorDate
 # simErr <- 1/((HumError/totAbun)^2 + (plotData$Cats/totAbun)^2)
  
  plot(simInd~plotData$Date, type="l", ylim = c(1.5,2.5), ylab = "Simpson's Diversity",
       xlab = "Date", main = "Projected Site Diversity Over Next 6 Months")  
#  points(simInd~plotData$Date, type="l")
}


calcShan <- function(plotData){
  hum <- plotData$Adults + plotData$Babies
  totAbun <- hum + plotData$Cats
  shanInd <- ((hum/totAbun)*log((hum/totAbun)) + (plotData$Cats/totAbun)*log((plotData$Cats/totAbun)))*-1
  #HumError <- plotData$Adults + plotData$Babies*plotData$P_LaborPriorDate
 # shanErr <- ((HumError/totAbun)*log((HumError/totAbun)) + (plotData$Cats/totAbun)*log((plotData$Cats/totAbun)))*-1
  
  plot(shanInd~plotData$Date, type="l", ylim = c(0.5,1), ylab = "Shannon Diversity",
       xlab = "Date", main = "Projected Site Diversity Over Next 6 Months")  
  #points(shanInd~plotData$Date, type="l")
  
}

# ------------------------------------------------------------------------------
# Abundance Graphs
calctotal <- function(plotData){
  tot <- plotData$Adults + plotData$Cats + plotData$Babies
  plot(tot ~ Date, data = plotData,  type="l", ylim = c(0,7), ylab = "Abundance", 
       main="Projected Site Abundance Over Next 6 Months")
  
}

calcSpecies  <- function(plotData){
  human <- plotData$Adults + plotData$Babies
  
  plot(human ~ Date, data = plotData,  type="l", ylim = c(0,5), ylab = "Abundance", 
       main="Projected Site Abundance by Age Class Over Next 6 Months")
  lines(Cats ~ Date, data = plotData, lty = 2, col = "Black")
  legend("topright", c("Human", "Feline"), 
         col = c("Black", "grey"),
         lty = c(1,2))
  
  
}

calcAge <- function(plotData){
 
  plot(Adults ~ Date, data = plotData,  type="l", ylim = c(0,5), ylab = "Abundance", 
       main="Projected Site Abundance by Age Class Over Next 6 Months")
  lines(Cats ~ Date, data = plotData, lty = 2, col = "grey")
  lines(Babies ~ Date, data = plotData, col = "Purple")
  legend("topright", c("Adult", "Youth","Juvenile"), 
                    col = c("Black", "grey", "Purple"),
                    lty = c(1,2,1))
    
}

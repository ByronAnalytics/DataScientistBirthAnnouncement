# Create datafile, save as RData object.

startDate <- as.Date("08 02 2017", format = "%m %d %Y")
dueDate <- as.Date("05 09 2018", format = "%m %d %Y")
dates <- seq(startDate, dueDate + 27, by = "days")
cats <- rep(2,length(dates))  
adults <- rep(2,length(dates))
babies <- c(rep(0, which(dates == dueDate)-1), rep(1, length(dates)-which(dates == dueDate)+1))
HouseData <- data.frame("Date" = dates, "Cats" = cats,"Adults" = adults, "Babies" =  babies, stringsAsFactors = FALSE)
rm(startDate, dueDate, dates, cats, adults, babies)

# Add dates to houseData
labor <- read.csv("Data/LaborProbTable.csv", stringsAsFactors = FALSE)
labor$Date <- dates[labor$DaysPregnant[1]:labor$DaysPregnant[length(labor$DaysPregnant)]]
HouseData <- left_join(HouseData, labor, by = "Date")
rm(labor)

#labor data starts at 36weeks, set values before to 0 or 1. 
HouseData$P_Labor[is.na(HouseData$P_Labor)] <- 0 
HouseData$P_LaborPriorDate[is.na(HouseData$P_LaborPriorDate)] <- 0 
HouseData$P_LaborAfterDate[is.na(HouseData$P_LaborAfterDate)] <- 1 
HouseData <- HouseData[,c("Date", "Cats", "Adults", "Babies", "P_Labor", 
                          "P_LaborPriorDate", "P_LaborAfterDate")]

save(HouseData, file="Data/HousData.Rdata")


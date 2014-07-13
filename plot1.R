plot1 <- function() {
    #set working directory
    setwd("C:/Coursera/Data/")
    
    #filename
    fName <- "household_power_consumption.txt"
    fPath <- "C:/Coursera/Data Science Track/Exploratory Data Analysis/Project1/"
    
    #open file.
    data <- read.table(fName, header = TRUE, sep = ";", na.strings = "?")
    
    #get feb.1 & feb.2 data
    data.feb1 <- data[data$Date == "1/2/2007", ]
    data.feb2 <- data[data$Date == "2/2/2007", ]
    
    data.comb <- rbind(data.feb1, data.feb2)
    hist(data.comb$Global_active_power, col = "red", main = "Global Active Power", 
                xlab = "Global Active Power (killowatts)")
    
    setwd(fPath)
    dev.copy(png, filename = "plot1.png")
    dev.off()
}

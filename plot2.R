plot2 <- function() {
    #set working directory
    setwd("C:/Coursera/Data/")
    
    #filename
    fName <- "household_power_consumption.txt"
    fPath <- "C:/Coursera/Data Science Track/Exploratory Data Analysis/Project1/"
    
    #open file.
    data <- read.table(fName, header = TRUE, sep = ";", na.strings = "?")
    
    #get feb.1 & feb.2 data
    data.test <- data[with(data, Date=="1/2/2007" | Date == "2/2/2007"), ]
    dateTime <- strptime( paste(data.test$Date,data.test$Time), 
                          format="%d/%m/%Y %H:%M:%S")
    data.test <- cbind(data.test, dateTime)
        
    #construct the plot
    with(data.test, plot(dateTime, Global_active_power, type="l",
                            ylab = "Global Active Powwer (killowatts)", xlab = ""))
    
    setwd(fPath)
    dev.copy(png, filename = "plot2.png")
    dev.off()
}
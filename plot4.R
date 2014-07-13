plot4 <- function() {
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
    
    setwd(fPath)
    png("plot4.png", width = 480, height = 480)
    par(mfrow = c(2,2))
    with(data.test, {
        plot(dateTime, Global_active_power, type="l",
             ylab = "Global Active Powwer (killowatts)", xlab = "")
        plot(dateTime, Voltage, type="l",
             ylab = "Voltage", xlab = "datetime")
        plot(dateTime, Sub_metering_1, type="l",col= "black",
            ylab = "Energy sub meeting", xlab="")
        lines(dateTime, data.test$Sub_metering_2, col = "red")
        lines(dateTime, data.test$Sub_metering_3, col = "blue")   
        legend("topright", col = c("black", "red", "blue"),inset = .05, lty=1, bty="n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(dateTime, Global_reactive_power, type="l",
            ylab = "Global_reactive_power (killowatts)", xlab = "datetime")
    })
    
    dev.off()
}
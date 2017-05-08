library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
data$dateTime<-paste(data$Date, data$Time)
data$dateTime<-dmy_hms(data$dateTime)

start<-dmy_hms("01/02/2007 00:00:00")
end<-dmy_hms("03/02/2007 00:00:00")
dataToUse <- data[data$dateTime >= start & data$dateTime < end,  ]
rm(data)

dev.off()
png(filename = "plot2.png",width = 480, height = 480)
plot(dataToUse$dateTime, dataToUse$Global_active_power, col = "black", xlab = "Global Active Power (kilowatts)", 
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()
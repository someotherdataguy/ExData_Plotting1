library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
data$dateTime<-paste(data$Date, data$Time)
data$dateTime<-dmy_hms(data$dateTime)

start<-dmy_hms("01/02/2007 00:00:00")
end<-dmy_hms("03/02/2007 00:00:00")
dataToUse <- data[data$dateTime >= start & data$dateTime < end,  ]
rm(data)

dev.off()
png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

plot(dataToUse$dateTime, dataToUse$Global_active_power, col = "black", xlab = "", ylab = "Global Active Power", type = "l")

plot(dataToUse$dateTime, dataToUse$Voltage, col = "black", xlab = "datetime", ylab = "Voltage", type = "l")

plot(dataToUse$dateTime, dataToUse$Sub_metering_1, col = "black", ylab = "Energy sub metering", type = "l", xlab = "")

lines(dataToUse$dateTime, dataToUse$Sub_metering_2, col = "red")
lines(dataToUse$dateTime, dataToUse$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1),bty = "n")

plot(dataToUse$dateTime, dataToUse$Global_reactive_power, col = "black", xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")

dev.off()
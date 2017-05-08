library(lubridate)
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = c(rep("character",2), rep("numeric",7)), na.strings = "?")
data$dateTime<-paste(data$Date, data$Time)
data$dateTime<-dmy_hms(data$dateTime)

start<-dmy_hms("01/02/2007 00:00:00")
end<-dmy_hms("03/02/2007 00:00:00")
dataToUse <- data[data$dateTime >= start & data$dateTime < end,  ]
rm(data)

dev.off()
png(filename = "plot1.png",width = 480, height = 480)
hist(dataToUse$Global_active_power, 20, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
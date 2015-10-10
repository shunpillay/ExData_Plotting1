fileName = "household_power_consumption.txt"
dataFullset <- read.table(fileName, header = TRUE, sep = ";", na.strings = c("?",""))

dataFullset$Date <- as.Date(dataFullset$Date,  format = "%d/%m/%Y")
dataFullset$timetemp <- paste(dataFullset$Date, dataFullset$Time)  
dataFullset$Time <- strptime(dataFullset$timetemp, format = "%Y-%m-%d %H:%M:%S")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
dataSubset <- subset(dataFullset, dataFullset$Date == startDate | dataFullset$Date == endDate)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dataSubset$Time, dataSubset$Global_active_power, ylab = "Global Active Power", type="l", xlab=NA)

plot(dataSubset$Time, dataSubset$Voltage, ylab = "Voltage", type="l", xlab = "datetime")

plot(dataSubset$Time, dataSubset$Sub_metering_1, ylab = "Energy sub metering", xlab=NA, type="l", col = "black")
lines(dataSubset$Time, dataSubset$Sub_metering_2, ylab = NA, xlab=NA, col = "red")
lines(dataSubset$Time, dataSubset$Sub_metering_3, ylab = NA, xlab=NA, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")

plot(dataSubset$Time, dataSubset$Global_reactive_power, ylab = "Global_reactive_power", type="l", xlab = "datetime")

dev.off()





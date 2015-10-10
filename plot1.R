fileName = "household_power_consumption.txt"
dataFullset <- read.table(fileName, header = TRUE, sep = ";", na.strings = c("?",""))

dataFullset$Date <- as.Date(dataFullset$Date,  format = "%d/%m/%Y")
dataFullset$timetemp <- paste(dataFullset$Date, dataFullset$Time)  
dataFullset$Time <- strptime(dataFullset$timetemp, format = "%Y-%m-%d %H:%M:%S")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
dataSubset <- subset(dataFullset, dataFullset$Date == startDate | dataFullset$Date == endDate)

png("plot1.png", width = 480, height = 480)
hist(dataSubset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power" )
dev.off()

dataFile <- "C:/Users/user/Desktop/Coursera/exploratory assign1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##str(subsetData)

globalActivePower <- as.numeric(subsetData$Global_active_power)
weekDay <- strptime(paste(subsetData$Date,subsetData$Time,sep=" "), '%d/%m/%Y %H:%M:%S')
voltage <- as.numeric(subsetData$Voltage)
submetering1 <- as.numeric(subsetData$Sub_metering_1)
submetering2 <- as.numeric(subsetData$Sub_metering_2)
submetering3 <- as.numeric(subsetData$Sub_metering_3)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))


#Graph on topleft
plot(weekDay,globalActivePower, type="l", xlab = "",ylab="Global Active Power(kilowatts)")

#Graph on topright
plot(weekDay, voltage, type="l", xlab="datetime", ylab="Voltage")

#Graph on bottomleft
plot(weekDay,submetering1, type="l", xlab = "",ylab="Global Active Power(kilowatts)")
lines(weekDay, submetering2, type="l", col = "red")
lines(weekDay, submetering3, type="l", col="blue")
legend("topright", lty=1, lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Graph on bottomright
plot(weekDay, globalReactivePower,type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()


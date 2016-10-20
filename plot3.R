dataFile <- "C:/Users/user/Desktop/Coursera/exploratory assign1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##str(subsetData)


submetering1 <- as.numeric(subsetData$Sub_metering_1)
submetering2 <- as.numeric(subsetData$Sub_metering_2)
submetering3 <- as.numeric(subsetData$Sub_metering_3)
weekDay <- strptime(paste(subsetData$Date,subsetData$Time,sep=" "), '%d/%m/%Y %H:%M:%S')
png("plot3.png", width=480, height=480)


plot(weekDay,submetering1, type="l", xlab = "",ylab="Global Active Power(kilowatts)")
lines(weekDay, submetering2, type="l", col = "red")
lines(weekDay, submetering3, type="l", col="blue")

legend("topright", lty=1, lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

dataFile <- "C:/Users/user/Desktop/Coursera/exploratory assign1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##str(subsetData)

globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot1.png", width=480, height=480)
with(subsetData, hist(globalActivePower, col="red"), main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()


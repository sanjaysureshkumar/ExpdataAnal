file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)
SData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
dt <- strptime(paste(SData$Date, SData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SData$Global_active_power)
subMetering1 <- as.numeric(SData$Sub_metering_1)
subMetering2 <- as.numeric(SData$Sub_metering_2)
subMetering3 <- as.numeric(SData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dt, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, subMetering2, type="l", col="red")
lines(dt, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dt, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
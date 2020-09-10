  
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)
SData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

hist(as.numeric(SData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plott1.png")
dev.off()
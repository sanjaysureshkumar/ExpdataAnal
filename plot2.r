  
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)
SData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

dt<-strptime(paste(SData$Date,SData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(SData$Global_active_power)
plot(dt,globalActivePower,type="l",xlab=" ", ylab="Global Active Power (kilowatts)")
dev.copy(png, filename="plot2.png")
dev.off()
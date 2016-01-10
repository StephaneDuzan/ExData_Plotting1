plot4 <- function() {
   
   Sys.setlocale(category = "LC_TIME", locale="en_US.UTF-8")
   
   ## Get file
   fileName <- "household_power_consumption.txt"
   filePath <- file.path("./data",fileName)
   
   data <- read.table(filePath,sep=";", header = TRUE, stringsAsFactors = FALSE)
   
   ## Subset data
   dmin <- as.Date("01/02/2007", format="%d/%m/%Y")
   dmax <- as.Date("03/02/2007", format="%d/%m/%Y")
   data$Date <- as.Date(data$Date,format="%d/%m/%Y")
   
   data <- subset(data, data$Date>=dmin)
   data <- subset(data, data$Date<dmax)
   
   ## Convert data
   data[,3] <- as.numeric(data[,3])
   data[,4] <- as.numeric(data[,4])
   data[,5] <- as.numeric(data[,5])
   data[,6] <- as.numeric(data[,6])
   data[,7] <- as.numeric(data[,7])
   data[,8] <- as.numeric(data[,8])
   data[,9] <- as.numeric(data[,9])
   
   ## Generate timestamp
   TimeStamp <- paste(data$Date,data$Time)
   TimeStamp <- strptime(TimeStamp, "%Y-%m-%d %H:%M:%S")
   
   data <- cbind(data,TimeStamp)
   
   ## Generate plot
   png(file="plot4.png", width=480,height=480)
   par(mfrow=c(2,2))
   ## Plot 1
   plot(data$TimeStamp,data$Global_active_power,type="l", xlab="", ylab="Global Active Power")
   ## Plot 2
   plot(data$TimeStamp,data$Voltage,type="l", xlab="datetime", ylab="Voltage")
   ## Plot 3
   plot(data$TimeStamp, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
   lines(data$TimeStamp, data$Sub_metering_2, type="l", col="red")
   lines(data$TimeStamp, data$Sub_metering_3, type="l", col="blue")
   legend("topright", lty="solid", bty="n", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
   ## Plot 4
   plot(data$TimeStamp,data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
   dev.off()
   
}
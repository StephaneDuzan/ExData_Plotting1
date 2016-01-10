plot1 <- function() {
   
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
   
   ## Generate plot
   png(file="plot1.png", width=480,height=480)
   hist(data$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
   dev.off()
   
}
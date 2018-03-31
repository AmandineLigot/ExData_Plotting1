plot_3 <- function() {
  
  #read the data
  data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
  
  #get the date and time all together in Time column
  data$Time <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  #get the date format for Date column
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  #Create the sub data between 2007-02-01 and 2007-02-02
  subdata <- subset(data, "2007-02-01" == data$Date | "2007-02-02" == data$Date)
  
  #create the graph
  png(file = "plot 3.png")
  
  par(mfrow = c(1,1), mar = c(4,4,2,1))
  
  plot(subdata$Time,subdata$Sub_metering_1, type = "n", xlab ="", ylab = "Energy sub metering")
  points(subdata$Time, subdata$Sub_metering_1, col = "black", type = "l")
  points(subdata$Time, subdata$Sub_metering_2, col = "red", type = "l")
  points(subdata$Time, subdata$Sub_metering_3, col = "blue", type = "l")
  legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ))
  
  
  dev.off()
  }
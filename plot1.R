plot_1 <- function() {
  
  #read the data
  data <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")
  
  #get the date and time all together in Time column
  data$Time <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  #get the date format for Date column
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  #Create the sub data between 2007-02-01 and 2007-02-02
  subdata <- subset(data, "2007-02-01" == data$Date | "2007-02-02" == data$Date)
  
  #create the histogram
  png(file = "plot 1.png")
  
  par(mfrow = c(1,1))
  
  hist(as.numeric(subdata$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
  
  dev.off()
  }
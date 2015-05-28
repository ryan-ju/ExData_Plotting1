plot4 <- function() {
  # Read data file, which is created by filtering the original "household_power_consumption.txt" with the "extract.gawk" script.
  data <- read.table("household_power_consumption_2007_02_01_to_2007_02_02.txt", stringsAsFactors = FALSE, header = TRUE, sep=";", na.strings = "?")
  
  # Create Date_time column in data.  Note the timezone is the system's by default.
  data$Date_time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  # Output to png
  png("plot4.png")
  
  # Set the layout to be 2x2
  par(mfrow = c(2, 2))
  
  # Plot top left
  plot(x = data$Date_time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  # Plot top right
  plot(x = data$Date_time, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  # Plot bottom left
  plot(x = data$Date_time, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(x = data$Date_time, y = data$Sub_metering_1, col = "black")
  lines(x = data$Date_time, y = data$Sub_metering_2, col = "red")
  lines(x = data$Date_time, y = data$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
  
  # Plot bottom right
  plot(x = data$Date_time, y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}
plot2 <- function() {
  # Read data file, which is created by filtering the original "household_power_consumption.txt" with the "extract.gawk" script.
  data <- read.table("household_power_consumption_2007_02_01_to_2007_02_02.txt", stringsAsFactors = FALSE, header = TRUE, sep=";", na.strings = "?")
  
  # Create Date_time column in data.  Note the timezone is the system's by default.
  data$Date_time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  # Plot the graph
  png("plot2.png")
  plot(x = data$Date_time, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}
#=================
#
# BASE PLOTTING 4
#
#=================

# Load dataset containing 9 variable attributes and 2,075,259 rows
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   nrows = 2075260, header = TRUE, sep = ";", na.strings = "?")

# Read only a subset of the data corresponding to 02/01/2007 to 02/02/2007 
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(1:9))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
Date_Time <- as.POSIXct(paste(data$Date, data$Time))  #Date_Time will also be used in 3 other graphs

# Combine graphs into a 2-by-2 matrix
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))
plot(data$Global_active_power ~ Date_Time, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Voltage ~ Date_Time, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Sub_metering_1 ~ Date_Time, type = "l", xlab = "", ylab = "Energy sub metering", 
     ylim = c(0, max(data$Sub_metering_1)))
lines(data$Sub_metering_2 ~ Date_Time, type = "l", col = "red")
lines(data$Sub_metering_3 ~ Date_Time, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bty = "n")
plot(data$Global_reactive_power ~ Date_Time, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


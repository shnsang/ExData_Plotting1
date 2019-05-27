#=================
#
# BASE PLOTTING 3
#
#=================

# Load dataset containing 9 variable attributes and 2,075,259 rows
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   nrows = 2075260, header = TRUE, sep = ";", na.strings = "?")

# Read only a subset of the data corresponding to 02/01/2007 to 02/02/2007 
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(1:9))

data$Date <- as.Date(data$Date, "%d/%m/%Y")
Date_Time <- as.POSIXct(paste(data$Date, data$Time))  #Date_Time will also be used in 3 other graphs

# Multiple line charts of sub_metering_1 to sub_metering_3
png(file = "plot3.png", width = 480, height = 480)

plot(data$Sub_metering_1 ~ Date_Time, type = "l", xlab = "", ylab = "Energy sub metering", 
     ylim = c(0, max(data$Sub_metering_1)))
lines(data$Sub_metering_2 ~ Date_Time, type = "l", col = "red")
lines(data$Sub_metering_3 ~ Date_Time, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1)

dev.off()
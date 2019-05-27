#=================
#
# BASE PLOTTING 2
#
#=================

# Load dataset containing 9 variable attributes and 2,075,259 rows
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   nrows = 2075260, header = TRUE, sep = ";", na.strings = "?")

# Read only a subset of the data corresponding to 02/01/2007 to 02/02/2007 
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(1:9))

# Line chart of global_active_power
png(file = "plot2.png", width = 480, height = 480)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
Date_Time <- as.POSIXct(paste(data$Date, data$Time))  #Date_Time will also be used in 3 other graphs
plot(data$Global_active_power ~ Date_Time, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
#=================
#
# BASE PLOTTING 1
#
#=================

# Load dataset containing 9 variable attributes and 2,075,259 rows
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"),
                   nrows = 2075260, header = TRUE, sep = ";", na.strings = "?")

# Read only a subset of the data corresponding to 02/01/2007 to 02/02/2007 
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007", select = c(1:9))

# Histogram for global_active_power 
png(file = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
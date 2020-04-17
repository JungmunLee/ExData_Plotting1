###########################################################################################
# 
# Exploratory Data Analysis : Course Project 1
#
# script file :plot4.R
#
###########################################################################################
rm(list = ls())

# read data file
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings="?")

# select data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the Date and Time variables to Date/Time classes
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))

# create a graph into a png file
png(filename="plot4.png", height=480, width=480)

# divide the screen
par(mfrow=c(2,2))

# Plot(1,1) 
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot(1,2) 
plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot(2,1) 
plot(data$datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(data$datetime, data$Sub_metering_2, col="red")

lines(data$datetime, data$Sub_metering_3, col="blue")

legend("topright", col=c("black","red","blue"), lty=1,
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Plot(2,2) 
plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

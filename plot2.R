###########################################################################################
# 
# Exploratory Data Analysis : Course Project 1
#
# script file :plot2.R
#
###########################################################################################
rm(list = ls())

# read data file
data <- read.table("household_power_consumption.txt", 
                    header = TRUE, sep=";", na.strings = "?")

# select data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# convert the Date and Time variables to Date/Time classes
data$datetime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))

# create a graph into a png file
png(filename="plot2.png", height=480, width=480)

plot(data$Global_active_power ~ data$datetime, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

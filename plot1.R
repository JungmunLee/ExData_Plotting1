###########################################################################################
# 
# Exploratory Data Analysis : Course Project 1
#
# script file :plot1.R
#
###########################################################################################
rm(list = ls())

# read data file
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings="?")

# select data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# create a graph into a png file
png(filename="plot1.png", height=480, width=480)
    
hist(as.numeric(data$Global_active_power), 
     main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red" )

dev.off()
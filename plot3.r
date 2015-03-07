# set working directory
setwd("~/Google Drive/3. My Resources/Coursera/Data Science Specialization/4. Exploratory Data Analysis/Assignments/Week 1")

# read data
fulldata <- read.table("./household_power_consumption.txt", header = TRUE , sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# subset data to be between 1/2/2007 and 2/2/2007
data <- subset(fulldata, fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007")

# setting the datetime variable
data$Time <- strptime(paste(data[, 1], data[, 2]), "%d/%m/%Y %H:%M:%S")

# line chart of sub-metering 1, 2 and 3, with legend (against time)
with(data, plot(Time, Sub_metering_1, type = "l", col = "black"))
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# storing to .png file
png("plot3.png", width=480, height= 480)

with(data, plot(Time, Sub_metering_1, type = "l", col = "black"))
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
# set working directory
setwd("~/Google Drive/3. My Resources/Coursera/Data Science Specialization/4. Exploratory Data Analysis/Assignments/Week 1")

# read data
fulldata <- read.table("./household_power_consumption.txt", header = TRUE , sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# subset data to be between 1/2/2007 and 2/2/2007
data <- subset(fulldata, fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007")

# setting the datetime variable
data$Time <- strptime(paste(data[, 1], data[, 2]), "%d/%m/%Y %H:%M:%S")

# 4 charts as specified in question
par(mfrow = c(2,2))

plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$Time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

with(data, plot(Time, Sub_metering_1, type = "l", col = "black"))
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1,1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, type = "l", ylab = "GLobal_reactive_power", xlab = "datetime")

# storing to .png file
png("plot4.png", width=480, height= 480)

par(mfrow = c(2,2))

plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(data$Time, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

with(data, plot(Time, Sub_metering_1, type = "l", col = "black"))
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = c(1,1) , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, type = "l", ylab = "GLobal_reactive_power", xlab = "datetime")

dev.off()
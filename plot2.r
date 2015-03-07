# set working directory
setwd("~/Google Drive/3. My Resources/Coursera/Data Science Specialization/4. Exploratory Data Analysis/Assignments/Week 1")

# read data
fulldata <- read.table("./household_power_consumption.txt", header = TRUE , sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))

# subset data to be between 1/2/2007 and 2/2/2007
data <- subset(fulldata, fulldata$Date == "1/2/2007" | fulldata$Date == "2/2/2007")

# setting the datetime variable
data$Time <- strptime(paste(data[, 1], data[, 2]), "%d/%m/%Y %H:%M:%S")

# line chart of global active power (against time)
plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# storing to .png file
png("plot2.png", width=480, height= 480)

plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
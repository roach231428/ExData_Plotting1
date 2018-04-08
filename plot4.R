library(lattice)
library(grid)
# Let string input not be transformed into factor format
options(stringsAsFactors = FALSE)

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Extract data whose Date is between 2007/02/02 and 2007/02/02
needData <- rawData[as.Date(rawData[,1], "%d/%m/%Y") >= as.Date("2007/02/01") & 
                      as.Date(rawData[,1], "%d/%m/%Y") <= as.Date("2007/02/02"), ]
time = strptime(paste(needData[,1], needData[,2]), format  ="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(time, needData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(time, needData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(time, needData$Sub_metering_1, type = "l", xlab = "", ylab = "Global Active Power")
points(time, needData$Sub_metering_2, type = "l", col = "red")
points(time, needData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, lty = 1, 
       cex = 0.95, bty = "n")

plot(time, needData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()
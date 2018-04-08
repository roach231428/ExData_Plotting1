library(lattice)
library(grid)
# Let string input not be transformed into factor format
options(stringsAsFactors = FALSE)

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Extract data whose Date is between 2007/02/02 and 2007/02/02
needData <- rawData[as.Date(rawData[,1], "%d/%m/%Y") >= as.Date("2007/02/01") & 
                      as.Date(rawData[,1], "%d/%m/%Y") <= as.Date("2007/02/02"), ]
png("plot2.png", width=480, height=480)
time = strptime(paste(needData[,1], needData[,2]), format  ="%d/%m/%Y %H:%M:%S")
plot(time, needData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

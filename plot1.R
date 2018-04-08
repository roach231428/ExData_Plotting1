# Let string input not be transformed into factor format
options(stringsAsFactors = FALSE)

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Extract data whose Date is between 2007/02/02 and 2007/02/02
needData <- rawData[as.Date(rawData[,1], "%d/%m/%Y") >= as.Date("2007/02/01") & 
                      as.Date(rawData[,1], "%d/%m/%Y") <= as.Date("2007/02/02"), ]

png("plot1.png", width = 480, height = 480)
hist(as.numeric(needData$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red")
dev.off()

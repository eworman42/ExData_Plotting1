## Getting and organizing data

fulldata <- read.csv("C:/Users/Jenny/Desktop/data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## Subsetting the data
timeframe <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
contime <- paste(as.Date(timeframe$Date), timeframe$Time)
timeframe$Datetime <- as.POSIXct(hello_ig)

## Producing plot 2
plot(timeframe$Global_active_power~timeframe$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving a copy of plot 2

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
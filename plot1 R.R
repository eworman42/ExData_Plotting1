## Getting & Organizing Datas
datas <- read.csv("C:/Users/Jenny/Desktop/data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datas$Date <- as.Date(datas$Date, format="%d/%m/%Y")
datas$Time <- strptime(datas$Time, format = "#H:#M:#S")

## Subsetting the timeframe we're interested in
Timeframe<- subset(datas, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(Timeframe$Date), Timeframe$Time)
Timeframe$Datetime <- as.POSIXct(datetime)

## Producing plot 1
hist(Timeframe$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving plot 1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## Plot 2

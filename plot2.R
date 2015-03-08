plot2 <- function(){

## Read file
file2 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259)

## First column as Date
file2$Date <- as.Date(file2$Date, format="%d/%m/%Y")

## Subset data feb 1,2
subset2 <- subset(file2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file2)

## Converting dates
datetime <- paste(as.Date(subset2$Date), subset2$Time)
subset2$Datetime <- as.POSIXct(datetime)

## ploting
plot(subset2$Global_active_power~subset2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## save file
dev.copy(png, file="plot2.png" ,height=480, width=480)
dev.off()
}

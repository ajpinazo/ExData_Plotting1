plot1 <- function() {

## Read file
file1 <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259)

## First column as Date
file1$Date <- as.Date(file1$Date, format="%d/%m/%Y")

## Subset data feb 1,2
subset1 <- subset(file1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file1)

## Converting dates
datetime <- paste(as.Date(subset1$Date), subset1$Time)
subset1$Datetime <- as.POSIXct(datetime)

## Plotting
hist(subset1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


}
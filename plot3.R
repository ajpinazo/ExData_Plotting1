plot3 <- function(){

## Getting full dataset
file3 <- read.csv("household_power_consumption.txt", header=TRUE, 
sep=';', na.strings="?", nrows=2075259)

## First column as Date
file3$Date <- as.Date(file3$Date, format="%d/%m/%Y")

## Subset data feb 1,2
subset3 <- subset(file3, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file3)

## Converting dates
datetime <- paste(as.Date(subset3$Date), subset3$Time)
subset3 $Datetime <- as.POSIXct(datetime)

## Plotting
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(subset3, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})


## save file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

}
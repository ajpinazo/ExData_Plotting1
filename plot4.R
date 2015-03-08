plot4 <- function(){

## Read file
file4 <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259)
## First colum as Date
file4$Date <- as.Date(file4$Date, format="%d/%m/%Y")

## Subset data feb 1,2
subset4 <- subset(file4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(file4)

## Converting dates
datetime <- paste(as.Date(subset4$Date), subset4$Time)
subset4$Datetime <- as.POSIXct(datetime)

## Plotting
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset4, {
     plot(Global_active_power~Datetime, type = "l", 
     ylab = "Global Active Power", xlab = "")
     plot(Voltage~Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
     plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering",
          xlab = "")
     lines(Sub_metering_2~Datetime, col = 'red')
     lines(Sub_metering_3~Datetime, col = 'blue')
     legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
             bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ Datetime, type = "l", 
          ylab = "Global_rective_power", xlab = "datetime")
})

## save file
dev.copy(png, file="plot4.png" , height=480, width=480)
dev.off()

}
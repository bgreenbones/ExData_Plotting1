powcon <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", na.strings = "?", nrows = 750000)

powcon <- powcon[powcon[,1] == "1/2/2007" | powcon[,1] == "2/2/2007",]
powcon <- cbind(strptime(paste(powcon$Date, powcon$Time), format="%d/%m/%Y %H:%M:%S"), powcon)
powcon$Date <- NULL
powcon$Time <- NULL
colnames(powcon)[1] <- "datetime"

png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(powcon$datetime, powcon$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")
with(powcon, plot(datetime, Voltage, type="l"))
with(powcon, plot(datetime, powcon$Sub_metering_1, 
                  type="n", xlab="", ylab="Energy sub metering"))
lines(powcon$datetime, powcon$Sub_metering_1, type="l")
lines(powcon$datetime, powcon$Sub_metering_2, type="l", col="red")
lines(powcon$datetime, powcon$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), bty="n", legend = 
         c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
with(powcon, plot(datetime, Global_reactive_power, type="l"))
dev.off()
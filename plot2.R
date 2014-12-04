powcon <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", na.strings = "?", nrows = 750000)

powcon <- powcon[powcon[,1] == "1/2/2007" | powcon[,1] == "2/2/2007",]
powcon <- cbind(strptime(paste(powcon$Date, powcon$Time), format="%d/%m/%Y %H:%M:%S"), powcon)
powcon$Date <- NULL
powcon$Time <- NULL
colnames(powcon)[1] <- "datetime"

png(filename = "plot2.png")
plot(powcon$datetime, powcon$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

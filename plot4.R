## Read data
dataset="household_power_consumption.txt"
mydata<- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE)
## Subset data to be used for dates 2007-02-01 and 2007-02-02
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y"); 
subsetData<- mydata[mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02", ]
for (i in 3:ncol(subsetData)){      # Convert all the numeric columns
  subsetData[, i] <- as.numeric(subsetData[, i])
}
# Create a datetime variable
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

##Save it to a PNG file, width=480 pixels and height=480 pixels
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))  # Set the lay-out to 2 x 2

# 1st sub-plot
plot(datetime, subsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 2nd sub-plot
plot(datetime, subsetData$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3rd sub-plot
plot(datetime, subsetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subsetData$Sub_metering_2, type="l", col="red")
lines(datetime, subsetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

# 4th sub-plot
plot(datetime, subsetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the PNG file
dev.off()

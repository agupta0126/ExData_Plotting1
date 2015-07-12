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

##Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot3.png", width=480, height=480)

### Create plot of datetime vs Sub Metering 1 data
plot(datetime, subsetData$Sub_metering_1, type="l", xlab= "", ylab="Energy sub metering")

#Adds line graph for datetime vs Sub metering 2 data in red
lines(datetime, subsetData$Sub_metering_2, type="l", col="red")

#Adds line graph for datetime vs Sub metering 3 data in blue
lines(datetime, subsetData$Sub_metering_3, type="l", col="blue")

##Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()   # Close the PNG file
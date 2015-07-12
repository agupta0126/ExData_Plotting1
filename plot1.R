## Read data
dataset="household_power_consumption.txt"
mydata<- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE)
## Subset data to be used for dates 2007-02-01 and 2007-02-02
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y"); 
subsetData<- mydata[mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02", ]
for (i in 3:ncol(subsetData)){      # Convert all the numeric columns
  subsetData[, i] <- as.numeric(subsetData[, i])
}
##Save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)
### Create histogram for Global Active Power
hist(subsetData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()   # Close the PNG file
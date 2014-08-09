# Read in data for only February 1-2, 2007. Then assign the column names from header
data <-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=FALSE, sep=';', stringsAsFactors=FALSE)
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Create column combining date/time in date/time format
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

# Creates Sub Metering Plot
plot(data$DateTime,data$Sub_metering_1, type = "l",  xlab = "", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2, col="red")
lines(data$DateTime,data$Sub_metering_3, col="blue")
legend("topright", names(data[7:9]), col=c("black","red","blue"), lty = c(1,1,1))
dev.off()
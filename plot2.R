# Read in data for only February 1-2, 2007. Then assign the column names from header
data <-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=FALSE, sep=';', stringsAsFactors=FALSE)
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Create column combining date/time in date/time format
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

# Creates Global Active Power plot
plot(data$DateTime,data$Global_active_power, type = "l",  xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
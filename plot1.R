# Read in data for only February 1-2, 2007. Then assign the column names from header
data <-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=FALSE, sep=';', stringsAsFactors=FALSE)
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

png("plot1.png", width = 480, height = 480)

# Creates Global Active Power frequency histogram
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
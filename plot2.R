data <- read.table('data/household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F)

# Convert types
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset for test time range
data.test_subset <- subset(data, Date >= as.Date('2007-02-01', format='%Y-%m-%d') & Date < as.Date('2007-02-03', format='%Y-%m-%d'))

# Create plot
png(file="plot2.png", height=480, width=480)

with(data.test_subset, {
    Timestamp <- strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")
    plot(Timestamp,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
})

dev.off()

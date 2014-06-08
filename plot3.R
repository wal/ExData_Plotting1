data <- read.table('data/household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F)

# Convert types
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset for test time range
data.test_subset <- subset(data, Date >= as.Date('2007-02-01', format='%Y-%m-%d') & Date < as.Date('2007-02-03', format='%Y-%m-%d'))

# Create plot
png(file="plot3.png", height=480, width=480)

with(data.test_subset, {
    Timestamp <- strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")
    plot(Timestamp,Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
    lines(Timestamp,Sub_metering_2,col="red")
    lines(Timestamp,Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"),ncol=1,cex=0.8, bty="1",  inset =c(0,0),text.col=c("black"))
})

dev.off()

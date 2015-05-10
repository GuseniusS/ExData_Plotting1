if (!exists("data1")) {
    print('Loading Data')
    fname <- 'household_power_consumption.txt'
    data1 <- read.table(fname, sep = ";", header = TRUE,
                        stringsAsFactors = FALSE)
} else {
    print('Data already Loaded')
}

data2 <- subset(data1, Date ==  "1/2/2007" | Date == "2/2/2007")
data2$Date = as.Date(data2$Date, "%d/%m/%Y")
data2$Time <- strptime(data2$Time, format = "%H:%M:%S", tz = '')
timeObj <- strptime(paste(data2$Date,data2$Time$hour,data2$Time$min,data2$Time$sec), format="%Y-%m-%d %H %M %S")

png("plot3.png",width=480,height=480,units="px",res=72)
plot(timeObj, data2$Sub_metering_1, type = "n",
     ylab = "Energy sub metering",
     xlab = "" )
lines(timeObj, data2$Sub_metering_1, lty = 1, col = "black")
lines(timeObj, data2$Sub_metering_2, lty = 1, col = "red")
lines(timeObj, data2$Sub_metering_3, lty = 1, col = "blue")   
legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),
       col = c("black","red","blue"),lty=c(1,1),lwd=c(1,1))    
dev.off()    
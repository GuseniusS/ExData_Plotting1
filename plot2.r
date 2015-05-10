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

png("plot2.png",width=480,height=480,units="px",res=72)
plot(timeObj, data2$Global_active_power, type = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "" )
lines(timeObj, data2$Global_active_power, lty = 1)
dev.off()
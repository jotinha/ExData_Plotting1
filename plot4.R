#load data and reduce to used dates
dat <- read.table("data/household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",]

datetime <- strptime(paste(dat$Date,dat$Time),'%d/%m/%Y %H:%M:%S')

png("figure/plot4.png",width=480,height=480)
par(bg="transparent")

par(mfcol = c(2,2))

with(dat, {
   # Plot 1
   plot(datetime,Global_active_power,
        type='l',
        ylab="Global Active Power (kilowatts)",
        xlab="")
   
   
   # Plot 2
   colors <- c("black","red","blue")
   cnames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
   plot(datetime,Sub_metering_1,type='n',
        xlab="",
        ylab="Energy sub metering")
   
   for (i in 1:3) {
      lines(datetime,dat[[cnames[i]]],col=colors[i])
   }
   
   # Plot 3
   plot(datetime,Voltage,type='l')
   
   # Plot 4
   plot(datetime,Global_reactive_power,type='l')
})
   
dev.off()
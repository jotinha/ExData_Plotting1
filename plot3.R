#load data and reduce to used dates
dat <- read.table("data/household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",]

datetime <- strptime(paste(dat$Date,dat$Time),'%d/%m/%Y %H:%M:%S')

png("figure/plot3.png",width=480,height=480)
par(bg="transparent")

colors <- c("black","red","blue")
cnames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(datetime,dat$Sub_metering_1,type='n',
        xlab="",
        ylab="Energy sub metering")
   
for (i in 1:3) {
   lines(datetime,dat[[cnames[i]]],col=colors[i])
}

legend("topright",legend=cnames,col=colors,lty=1)

dev.off()
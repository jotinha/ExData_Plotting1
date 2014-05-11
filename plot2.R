#load data and reduce to used dates
dat <- read.table("data/household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",]

datetime <- strptime(paste(dat$Date,dat$Time),'%d/%m/%Y %H:%M:%S')

png("figure/plot2.png",width=480,height=480)
par(bg="transparent")

plot(datetime,dat$Global_active_power,
               type='l',
               ylab="Global Active Power (kilowatts)",
               xlab="")
dev.off()
              

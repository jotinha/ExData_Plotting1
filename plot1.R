#load data and reduce to used dates
dat <- read.table("data/household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",]

png("figure/plot1.png",width=480,height=480)
par(bg="transparent")

hist(dat$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")

dev.off()
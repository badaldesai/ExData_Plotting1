data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec = ".")

data<-subset(data,Date == "1/2/2007" | Date=="2/2/2007")

Globalap <- as.numeric(data$Global_active_power)

png("plot2.png",width=480,height=480)
datetime<- strptime(paste(data$Date, data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime,Globalap,type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

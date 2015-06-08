data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec = ".")

data<-subset(data,Date == "1/2/2007" | Date=="2/2/2007")

datetime<- strptime(paste(data$Date, data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
submeter1<-as.numeric(data$Sub_metering_1)
submeter2<-as.numeric(data$Sub_metering_2)
submeter3<-as.numeric(data$Sub_metering_3)
Globalap <- as.numeric(data$Global_active_power)
Globalrp <- as.numeric(data$Global_reactive_power)
voltage <-as.numeric(data$Voltage)

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))

plot(datetime, Globalap,type="l",xlab="",ylab="Global Active Power")
plot(datetime, voltage, type="l",xlab="datetime",ylab="Voltage")
plot(datetime,submeter1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd =2.5, col=c("black","red","blue"))
plot(datetime,Globalrp,type="l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
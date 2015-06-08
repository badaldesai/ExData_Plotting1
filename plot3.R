data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec = ".")

data<-subset(data,Date == "1/2/2007" | Date=="2/2/2007")

datetime<- strptime(paste(data$Date, data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
submeter1<-as.numeric(data$Sub_metering_1)
submeter2<-as.numeric(data$Sub_metering_2)
submeter3<-as.numeric(data$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(datetime,submeter1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd =2.5, col=c("black","red","blue"))
dev.off()


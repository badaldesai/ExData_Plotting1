data<- read.table("household_power_consumption.txt",header=TRUE,sep=";",dec = ".")

data<-subset(data,Date == "1/2/2007" | Date=="2/2/2007")

data<-as.numeric(data$Global_active_power)
png("plot1.png",width=480,height=480)
hist(data,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
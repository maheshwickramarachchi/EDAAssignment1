setwd("./Data_Science/Course_04/Week01/EConsumption")
path<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(path,destfile = "EConsumption.zip" )

filePath<-"household_power_consumption.txt"
ECData1<-read.table(filePath,header=T,na.strings =NA,sep=";" )
ECData1$Date<-as.Date(ECData1$Date,format="%d/%m/%Y")
head(ECData1)
ECData<-subset(ECData1,Date=="2007/02/01"| Date=="2007/02/02")
library(lubridate)
ECData$DateTime<- ymd_hms(paste(ECData$Date,ECData$Time))


ECData$Global_active_power<-as.numeric(ECData$Global_active_power)
ECData$Global_reactive_power<-as.numeric(ECData$Global_reactive_power)
ECData$Voltage<-as.numeric(ECData$Voltage)
ECData$Global_intensity<-as.numeric(ECData$Global_intensity)
ECData$Sub_metering_1<-as.numeric(ECData$Sub_metering_1)
ECData$Sub_metering_2<-as.numeric(ECData$Sub_metering_2)
ECData$Sub_metering_3<-as.numeric(ECData$Sub_metering_3)
par(mfrow=c(2,2))

with(ECData,{
  plot(DateTime,Global_active_power,type = "l", xlab="datetime", ylab="Global Active Power (kilowatts)")
  plot(DateTime,Voltage,type = "l", xlab="datetime", ylab="Voltage")
  plot(DateTime,Sub_metering_1, type="l", xlab="datetime",ylab="Energy sub metering")
  lines(DateTime,Sub_metering_2, type="l",col="red")
  lines(DateTime,Sub_metering_3, type="l",col="blue")
  legend("topright",lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"),
         legend =c("Sub metering 1","Sub metering 2","Sub metering 3"), bty="n", cex=.5 )
  plot(DateTime,Global_reactive_power,type = "l", xlab="datetime", ylab="Global Reactive Power (kilowatts)")
}
)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
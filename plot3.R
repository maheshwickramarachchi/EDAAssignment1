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


ECData$Sub_metering_1<-as.numeric(ECData$Sub_metering_1)
ECData$Sub_metering_2<-as.numeric(ECData$Sub_metering_2)
ECData$Sub_metering_3<-as.numeric(ECData$Sub_metering_3)

par(mfrow=c(1,1))

plot(ECData$DateTime,ECData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(ECData$DateTime,ECData$Sub_metering_2, type="l",col="red")
lines(ECData$DateTime,ECData$Sub_metering_3, type="l",col="blue")
legend("topright",lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","blue"),
       legend =c("Sub metering 1","Sub metering 2","Sub metering 3") )
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
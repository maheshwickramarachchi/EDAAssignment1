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

par(mfrow=c(1,1))

plot(ECData$DateTime,ECData$Global_active_power,type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
filePath<-"household_power_consumption.txt"
ECData1<-read.table(filePath,header=T,na.strings =NA,sep=";" )
ECData1$Date<-as.Date(ECData1$Date,format="%d/%m/%Y")
head(ECData1)
ECData<-subset(ECData1,Date=="2007/02/01"| Date=="2007/02/02")
library(lubridate)
ECData$DateTime<- ymd_hms(paste(ECData$Date,ECData$Time))


ECData$Global_active_power<-as.numeric(ECData$Global_active_power)

par(mfrow=c(1,1))

hist(ECData$Global_active_power,col = "red", xlab = "Global Active Power(Kilowatts)",main = "Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
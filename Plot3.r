#Reading the data that is needed for project using sql statement with read.csv.sql of sqldf package


f<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",sep=";")

#Converting date and time to POSIXct.
datetime<-paste(f[,1],f[,2])
datetime<-as.POSIXct(strptime(datetime,'%d/%m/%Y %H:%M:%S'))

#specifying device and size of image 480x480
png("Plot3.png",480,480)

#Plotting
plot(datetime,f[,7],xlab="",ylab="Energy sub metering",type="l")
points(datetime,f[,8],col="red",type="l")
points(datetime,f[,9],col="blue",type="l")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1))

##closing the device
dev.off

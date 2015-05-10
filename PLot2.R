
#Reading the data that is needed for project using sql statement with read.csv.sql of sqldf package
f<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",sep=";")

#Converting date and time to POSIXct.
datetime<-paste(f[,1],f[,2])
datetime<-as.POSIXct(strptime(datetime,'%d/%m/%Y %H:%M:%S'))

#specifying device and size of image 480x480
png("Plot2.png",480,480)

#Plotting 
plot(datetime,f[,3],xlab="",ylab="Global Active Power (kilowatts)",type="l")

#Closing device
dev.off
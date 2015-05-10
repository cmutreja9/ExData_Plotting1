#Reading the data that is needed for project using sql statement with read.csv.sql of sqldf package
f<-read.csv.sql("household_power_consumption.txt",sql="select * from file where Date='1/2/2007' OR Date='2/2/2007'",sep=";")

#specifying size of png image 480x480
png("Plot1.png",480,480)

#plotting histogram
hist(f[,3],xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")

#closing the device
dev.off
##read in the file assumes the datafile is in your working directory 
df<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
## create a new column using date and time strings in POSIX time format
df$datetime <- strptime( paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")

## select relevant dates match in the date string 
## subdf<-df[df$Date %in% c("01/02/2007","02/02/2007"),]
subdf<-df[df$Date %in% c( "1/2/2007","2/2/2007"),]

png(file="plot4.png") ## open png file device.

##fourth plot
par(mfrow =c(2,2))
with(subdf,{
      plot(Global_active_power,type="l",ylab="Global Active Power",xlab="")
      plot(datetime,Voltage,type="l")
      plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
      points(datetime,Sub_metering_2,type="l", col="RED")
      points(datetime,Sub_metering_3,type="l", col="BLUE")
      legend("topright",lty=1, col =c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      plot(datetime,Global_reactive_power,type="l")
})


dev.off() ##close the device
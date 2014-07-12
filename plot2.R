##read in the file assumes the datafile is in your working directory 
df<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
## create a new column using date and time strings in POSIX time format
df$datetime <- strptime( paste(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")

## select relevant dates match in the date string 
## subdf<-df[df$Date %in% c("01/02/2007","02/02/2007"),]
subdf<-df[df$Date %in% c( "1/2/2007","2/2/2007"),]

png(file="plot2.png") ## open png file device.

## second plot
## plot a line graph global active power vs datetime
with(subdf,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

dev.off() ##close the device
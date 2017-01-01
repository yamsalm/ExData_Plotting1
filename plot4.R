install.packages("dplyr")
library(dplyr)
ds <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
ds <- filter(tbl_df( ds),Date %in% c("1/2/2007","2/2/2007"))
ds<- mutate(ds, datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))



png("plot4.png")
par(mfcol=c(2,2))
## first plot
plot(ds$datetime, ds$Global_active_power,type="n" ,ylab ="Global Active Power (kilowatts)" ,xlab="" )
lines(ds$datetime, ds$Global_active_power,type="l")

##second plot
plot(ds$datetime, ds$Sub_metering_1,type="n" ,ylab ="Energy Sub Metering" ,xlab=""  )
lines(ds$datetime, ds$Sub_metering_1,type="l", col="black")
lines(ds$datetime, ds$Sub_metering_2,type="l", col="red")
lines(ds$datetime, ds$Sub_metering_3,type="l", col="blue")

legend("topright",lty=c(1,1),lwd=c(2.5,2.5), legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue") ,bty = "n")

##third plot
plot(ds$datetime, ds$Voltage,type="n" ,ylab ="Voltage" ,xlab="datetime"  )
lines(ds$datetime, ds$Voltage,type="l")



##forth plot
plot(ds$datetime, ds$Global_reactive_power,type="n" ,ylab ="Global_reactive_power" ,xlab="datetime"  )
lines(ds$datetime, ds$Global_reactive_power,type="l" ) 

dev.off()

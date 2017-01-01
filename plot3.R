install.packages("dplyr")
library(dplyr)
ds <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
ds <- filter(tbl_df( ds),Date %in% c("1/2/2007","2/2/2007"))
ds<- mutate(ds, datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))



png("plot3.png")

plot(ds$datetime, ds$Sub_metering_1,type="n" ,ylab ="Energy Sub Metering" ,xlab=""  )
lines(ds$datetime, ds$Sub_metering_1,type="l", col="black")
lines(ds$datetime, ds$Sub_metering_2,type="l", col="red")
lines(ds$datetime, ds$Sub_metering_3,type="l", col="blue")

legend("topright",lty=c(1,1),lwd=c(2.5,2.5), legend =  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()

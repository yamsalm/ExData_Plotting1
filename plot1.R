install.packages("dplyr")
library(dplyr)
ds <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
ds <- filter(tbl_df( ds),Date %in% c("1/2/2007","2/2/2007"))
ds<- mutate(ds, datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


png("plot1.png")

hist(ds$Global_active_power , col = "red",xlab ="Global Active Power (kilowatts)" ,main="Global Active Power")
dev.off()
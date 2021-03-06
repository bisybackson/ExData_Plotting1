library(data.table)
library(dplyr)
library(lubridate)
consumption <- fread("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))
consumed <- filter(consumption, date(consumption$DateTime) == "2007-02-01" | date(consumption$DateTime) == "2007-02-02")
rm(consumption)
plot(Sub_metering_1 ~ DateTime, consumed, type="l", xlab="", ylab="Energy sub metering")
lines(Sub_metering_2 ~ DateTime, consumed, col="red")
lines(Sub_metering_3 ~ DateTime, consumed, col="blue")
legend("topright", grep("Sub", names(consumed), value=T), lwd=2, col=c("black","red","blue"), cex=0.5)
dev.copy(png, file="plot3.png", width = 480, height=480)
dev.off()

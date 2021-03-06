library(data.table)
library(dplyr)
library(lubridate)
consumption <- fread("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",stringsAsFactors = FALSE)
consumption$DateTime <- dmy_hms(paste(consumption$Date, consumption$Time))
consumed <- filter(consumption, date(consumption$DateTime) == "2007-02-01" | date(consumption$DateTime) == "2007-02-02")
rm(consumption)
plot(Global_active_power ~ DateTime, consumed, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width = 480, height=480)
dev.off()

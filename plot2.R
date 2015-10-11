rm(list = ls())
cat("\014")
library(dplyr)

file = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

file$Date = as.character(file$Date)

file = file[which(file$Date == "1/2/2007" | file$Date == "2/2/2007" ),]

file = within(file, {timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

file$Date = as.Date(file$Date,format = "%d/%m/%Y")

file = file %>% mutate(weekday = weekdays(Date))

png("plot2.png", width = 480, height = 480, units = "px")

plot(as.numeric(file$Global_active_power),type="l", ylab = "Global Active Power (kilowatts)")

dev.off()
rm(list = ls())
cat("\014")
library(dplyr)

file = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

file$Date = as.character(file$Date)

file = file[which(file$Date == "1/2/2007" | file$Date == "2/2/2007" ),]

file$Date = as.Date(file$Date,format = "%d/%m/%Y")

file = file %>% mutate(weekday = weekdays(Date))

file$Sub_metering_1 = as.numeric(file$Sub_metering_1)
file$Sub_metering_2 = as.numeric(file$Sub_metering_2)
file$Sub_metering_3 = as.numeric(file$Sub_metering_3)

png("plot3.png", width = 480, height = 480, units = "px")
plot(file$Sub_metering_1, type="l", col="black", ylim=c(0, 40),ylab = "Energy sub meetering")
par(new=TRUE)
plot(file$Sub_metering_2, type="l", col="red", ylim=c(0, 40),  xlab = "", ylab = "")
par(new=TRUE)
plot(file$Sub_metering_3, type="l", col="blue", ylim=c(0, 40),  xlab = "", ylab = "")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, col=c("black","red", "blue"), bty='0', cex=.75)
dev.off()

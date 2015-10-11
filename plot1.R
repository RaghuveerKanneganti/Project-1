rm(list = ls())
cat("\014")

file = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
file$Date = as.character(file$Date)
file = file[which(file$Date == "1/2/2007" | file$Date == "2/2/2007" ),]
file$Date = as.Date(file$Date,format = "%d/%m/%Y")

png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(file$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()
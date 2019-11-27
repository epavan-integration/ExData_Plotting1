library(dplyr)
power_data <- subset(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), sep=";", header = TRUE), Date == "1/2/2007"|Date == "2/2/2007" )
power_data <- mutate(power_data, Datetime = paste(as.character(Date),as.character(Time), sep = " "))
power_data$Datetime <- strptime(power_data$Datetime, "%d/%m/%Y %H:%M:%S")

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(power_data$Datetime,as.numeric(gsub(",",".",power_data$Global_active_power)), col = "white", ylab = "Global Active Power (kilowatts)" , xlab = "")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Global_active_power)), col = "black", ylab = "Global Active Power (kilowatts)")

plot(power_data$Datetime,as.numeric(gsub(",",".",power_data$Voltage)), col = "white", ylab = "Voltage" , xlab = "datetime")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Voltage)), col = "black", ylab = "Voltage")

plot(power_data$Datetime,as.numeric(gsub(",",".",power_data$Sub_metering_1)), col = "white", ylab = "Energy sub metering", xlab = "")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Sub_metering_1)), col = "black")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Sub_metering_2)), col = "red")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Sub_metering_3)), col = "blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_2"), col = c("black", "red", "blue"), lwd = 1)

plot(power_data$Datetime,as.numeric(gsub(",",".",power_data$Global_reactive_power)), col = "white", xlab = "datetime", ylab = "Global_reactive_power")
lines(power_data$Datetime,as.numeric(gsub(",",".",power_data$Global_reactive_power)), col = "black")


dev.off()

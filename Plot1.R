library(dplyr)
power_data <- subset(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), sep=";", header = TRUE), Date == "1/2/2007"|Date == "2/2/2007" )
power_data <- mutate(power_data, Datetime = paste(as.character(Date),as.character(Time), sep = " "))
power_data$Datetime <- strptime(power_data$Datetime, "%d/%m/%Y %H:%M:%S")

png(filename = "Plot1.png", width = 480, height = 480)
hist(as.numeric(gsub(",",".",power_data$Global_active_power)), col = "orangered2", xlab = "Global Active Power (kilowatts)" ,main = "Global Active Power", breaks = 12, ylim = c(0,1200), xlim=c(0,6))
dev.off()

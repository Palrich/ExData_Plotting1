source("reading_the_data.R")
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px")
par(mfrow = c(2, 2))

plot(Date_Time, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

plot(Date_Time, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

plot(Date_Time, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(Date_Time, Sub_metering_2, col = "red")
lines(Date_Time, Sub_metering_3, col = "blue")

legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

plot(Date_Time, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(house_data)[4])
dev.off()

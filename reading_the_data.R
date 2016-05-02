# For reproducibility purposes, make sure that the current working directory is set to the directory in which the data, "household_power_consumption.txt", can be read. This data can be found in this github repository or after extracting it from the zip file that is provided through the link via the coursera project webpage.

#
require(data.table, quietly = TRUE)

house_data <- fread("household_power_consumption.txt", colClasses = list(character = 1:2, numeric = 3:9), na = "?")

## It is only necessary for this project to have data from "1/2/2007" and "2/2/2007".
house_data <- house_data[Date == "1/2/2007" | Date == "2/2/2007", ]

# Could not get the strptime() function to work properly when house_data was of class data.table, so to get around this, I convert it back into solely a data frame.
house_data <- as.data.frame(house_data)

# Create a column for Date_Time in house_data to be used in plotting.
getDateTime <- paste(house_data$Date, house_data$Time)
house_data$Date_Time <- strptime(getDateTime, "%d/%m/%Y %H:%M:%S")

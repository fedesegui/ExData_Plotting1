plot3<- function(){
	## features of this function:
	## Assumes that household_power_consumption.txt file is located in working dir
	## 1. read the data file on household power consumption
	## 2. create a new variable with date and time
	## 3. assign the right classes to each column
	## 4. subset the file to get rows from 2 days: 2007-02-01 - 2007-02-02
	## 5. set the device (png)
 	## 6. generate the plot
	## 7. close the device

        data_power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, na.strings = "?", sep =";")
        
        data_power$date_time <- strptime(paste(data_power$Date, data_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        
        data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")
        data_power$Time <- format(data_power$Time, format="%H:%M:%S")
        data_power$Sub_metering_1 <- as.numeric(data_power$Sub_metering_1)
        data_power$Sub_metering_2 <- as.numeric(data_power$Sub_metering_2)
        data_power$Sub_metering_3 <- as.numeric(data_power$Sub_metering_3)
        
        useful_data <- subset(data_power, Date == "2007-02-01" | Date =="2007-02-02")
        
        png("plot3.png", width=480, height=480)

        with(useful_data, plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
	  lines(useful_data$date_time, useful_data$Sub_metering_2, col = "Red")
	  lines(useful_data$date_time, useful_data$Sub_metering_3, col = "Blue")
	  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

        dev.off()
}

plot1<- function(){
	## features of this function:
	## 1. read the data file on household power consumption
	## 2. assign the right classes to each column
	## 3. subset the file to get rows from 2 days: 2007-02-01 - 2007-02-02
	## 4. set the device (png)
 	## 5. generate the histogram
	## 6. close the device

	data_power <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

	data_power$Date <- as.Date(data_power$Date, format="%d/%m/%Y")
	data_power$Global_active_power <- as.numeric(data_power$Global_active_power)

	useful_data <- subset(data_power, Date == "2007-02-01" | Date == "2007-02-02")

	png("plot1.png", width=480, height=480)

	hist(useful_data$Global_active_power, main = paste("Global Active Power"), xlab="Global Active Power (kilowatts)", col="red", border="black")
        
	dev.off()
}

library("data.table")

setwd("/Users/lucasecarpio/Projects/R/samples/ExData_Plotting1")

#Reads in data and subsets for dates
DT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Prints readable data
DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# POSIXct date capable of being filtered and graphed
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates
DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(DT[, dateTime], DT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(DT[, dateTime], DT[, Sub_metering_2],col="red")
lines(DT[, dateTime], DT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()
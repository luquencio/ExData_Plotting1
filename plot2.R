library("data.table")

setwd("/Users/lucasecarpio/Projects/R/samples/ExData_Plotting1")

#Reads in data and subsets for specified dates
DT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#Prints readable data
DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#POSIXct date filtered and graphed
DT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates
DT <- DT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## plot2
plot(x = powerDT[, dateTime], y = powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
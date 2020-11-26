library("data.table")

setwd("/Users/lucasecarpio/Projects/R/samples/ExData_Plotting1")

#Reads in data and subsets for dates
DT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Prints readable data
DT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates
DT <- DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## plot1
hist(DT[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
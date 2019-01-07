# Code to plot a timeseries of the sub metering data.

library(data.table)
library(dplyr)

# Sets working directory to Coursera Assignment Directory
setwd("C:/Users/rober/Coursera/EDACourseProject1")

# Power datafilepath
datafilepath <- "household_power_consumption.txt"

## Reading Downloaded Datafiles ##
powerdatatable <- data.table::fread(input = datafilepath,header=TRUE, na.strings = "?") 

## Tidy datafile
# Making a POSIXct date to be filtered and graphed by time of day
powerdatatable[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Subset Dates for 2007-02-01 and 2007-02-02
powerdatatable <- subset(powerdatatable,(dateTime >= "2007-02-01") & (dateTime < "2007-02-03"))

# Setup plot 4
png("plot4.png", width=500, height=500)

par(mfrow=c(2,2))

#Plot 1
plot(x = powerdatatable[, dateTime]
     , y = powerdatatable[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Plot 2
plot(x = powerdatatable[, dateTime]
     , y = powerdatatable[, Voltage]
     , type="l", xlab="datetime", ylab="Voltage")

#Plot 3
plot(powerdatatable[, dateTime], powerdatatable[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdatatable[, dateTime], powerdatatable[, Sub_metering_2],col="red")
lines(powerdatatable[, dateTime], powerdatatable[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#Plot 4
plot(x = powerdatatable[, dateTime]
     , y = powerdatatable[, Global_reactive_power]
     , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

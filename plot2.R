# Code to plot a timeseries of the Global Active Power in kilowatts.

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

png("plot2.png", width=500, height=500)

## Plot 2
plot(x = powerdatatable[, dateTime]
     , y = powerdatatable[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()